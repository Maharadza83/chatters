// -----------------------------------------------------------------------------
// Plik: Hubs/ChatHub.cs
// Opis: Hub SignalR do obsługi komunikacji czatowej w czasie rzeczywistym.
//       Rozdziela wiadomości do konkretnych grup (kanałów, organizacji, projektów).
// -----------------------------------------------------------------------------
using Microsoft.AspNetCore.SignalR;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;
using ChatApp.Backend.Models;
using ChatApp.Backend.Data;
using Microsoft.EntityFrameworkCore;
using System; // Dodane dla Guid i DateTime
using System.Linq; // Dodane dla LINQ
using System.Threading.Tasks; // Dodane dla Task
using Microsoft.Extensions.Logging; // Dodane dla ILogger

namespace ChatApp.Backend.Hubs
{
    [Authorize] // Wszyscy użytkownicy łączący się z hubem muszą być zalogowani (JWT token)
    public class ChatHub : Hub
    {
        private readonly ApplicationDbContext _dbContext;
        private readonly ILogger<ChatHub> _logger;

        public ChatHub(ApplicationDbContext dbContext, ILogger<ChatHub> logger)
        {
            _dbContext = dbContext;
            _logger = logger;
        }

        // Metoda wywoływana, gdy klient łączy się z hubem
        public override async Task OnConnectedAsync()
        {
            var userId = Context.User?.FindFirstValue(ClaimTypes.NameIdentifier);
            var organizationIdClaim = Context.User?.FindFirstValue("OrganizationId");
            var projectIdClaim = Context.User?.FindFirstValue("ProjectId");

            if (!string.IsNullOrEmpty(userId) && !string.IsNullOrEmpty(organizationIdClaim) && !string.IsNullOrEmpty(projectIdClaim))
            {
                Guid organizationId = Guid.Parse(organizationIdClaim);
                Guid projectId = Guid.Parse(projectIdClaim);

                _logger.LogInformation($"Użytkownik {userId} ({organizationId}/{projectId}) połączony.");

                // Dodaj użytkownika do grup odpowiadających jego organizacji i projektowi
                // Dzięki temu łatwo będzie wysyłać wiadomości do wszystkich w danej organizacji/projekcie.
                await Groups.AddToGroupAsync(Context.ConnectionId, $"Org-{organizationId}");
                await Groups.AddToGroupAsync(Context.ConnectionId, $"Project-{projectId}");

                // Możesz również dołączyć użytkownika do wszystkich kanałów, do których należy.
                // To wymagałoby pobrania kanałów z bazy danych.
                var userChannels = await _dbContext.ChannelMembers
                    .Where(cm => cm.UserId == userId)
                    .Select(cm => cm.ChannelId.ToString())
                    .ToListAsync();

                foreach (var channelId in userChannels)
                {
                    await Groups.AddToGroupAsync(Context.ConnectionId, $"Channel-{channelId}");
                }

                // Poinformuj innych w tej samej organizacji/projekcie, że użytkownik jest online
                await Clients.Group($"Org-{organizationId}").SendAsync("UserStatusUpdate", userId, "online");
            }
            else
            {
                _logger.LogWarning("Nieautoryzowany lub niekompletny kontekst użytkownika w ChatHub.");
                Context.Abort(); // Rozłącz nieautoryzowane połączenie
            }
            await base.OnConnectedAsync();
        }

        // Metoda wywoływana, gdy klient rozłącza się z hubem
        public override async Task OnDisconnectedAsync(Exception? exception)
        {
            var userId = Context.User?.FindFirstValue(ClaimTypes.NameIdentifier);
            var organizationIdClaim = Context.User?.FindFirstValue("OrganizationId");

            if (!string.IsNullOrEmpty(userId) && !string.IsNullOrEmpty(organizationIdClaim))
            {
                _logger.LogInformation($"Użytkownik {userId} ({organizationIdClaim}) rozłączony.");
                await Groups.RemoveFromGroupAsync(Context.ConnectionId, $"Org-{organizationIdClaim}");

                // Poinformuj innych w tej samej organizacji, że użytkownik jest offline
                await Clients.Group($"Org-{organizationIdClaim}").SendAsync("UserStatusUpdate", userId, "offline");
            }
            await base.OnDisconnectedAsync(exception);
        }

        // Metoda do wysyłania wiadomości tekstowych do kanału
        public async Task SendMessageToChannel(Guid channelId, string messageText, string? replyToMessageId = null, string? fileUrl = null, string? mediaType = null)
        {
            var senderId = Context.User?.FindFirstValue(ClaimTypes.NameIdentifier);
            var organizationIdClaim = Context.User?.FindFirstValue("OrganizationId");
            var projectIdClaim = Context.User?.FindFirstValue("ProjectId");

            if (string.IsNullOrEmpty(senderId) || string.IsNullOrEmpty(organizationIdClaim) || string.IsNullOrEmpty(projectIdClaim))
            {
                _logger.LogWarning("SendMessageToChannel: Brak wymaganych informacji o użytkowniku/organizacji/projekcie.");
                return;
            }

            Guid organizationId = Guid.Parse(organizationIdClaim);
            Guid projectId = Guid.Parse(projectIdClaim);

            // Sprawdź, czy użytkownik jest członkiem tego kanału i czy kanał należy do jego organizacji/projektu
            var channel = await _dbContext.Channels
                .Include(c => c.ChannelMembers)
                .FirstOrDefaultAsync(c => c.Id == channelId &&
                                         c.OrganizationId == organizationId &&
                                         c.ProjectId == projectId &&
                                         c.ChannelMembers.Any(cm => cm.UserId == senderId));

            if (channel == null)
            {
                _logger.LogWarning($"Użytkownik {senderId} próbował wysłać wiadomość do nieautoryzowanego kanału {channelId}.");
                // Można wysłać informację zwrotną do klienta, że operacja nieudana
                await Clients.Caller.SendAsync("ReceiveError", "Nie masz uprawnień do wysyłania wiadomości do tego kanału.");
                return;
            }

            var message = new Message
            {
                Id = Guid.NewGuid(),
                SenderId = senderId,
                ChannelId = channelId,
                MessageText = messageText,
                Timestamp = DateTime.UtcNow,
                MediaType = mediaType ?? "text",
                FileUrl = fileUrl,
                OrganizationId = organizationId,
                ProjectId = projectId,
                ReplyToMessageId = string.IsNullOrEmpty(replyToMessageId) ? (Guid?)null : Guid.Parse(replyToMessageId)
            };

            _dbContext.Messages.Add(message);
            await _dbContext.SaveChangesAsync();

            // Rozgłoś wiadomość do wszystkich klientów w grupie kanału
            await Clients.Group($"Channel-{channelId}").SendAsync("ReceiveMessage", new
            {
                message.Id,
                SenderId = message.SenderId,
                SenderName = Context.User?.Identity?.Name ?? "Nieznany", // Możesz pobrać z ApplicationUser pełną nazwę
                message.ChannelId,
                message.MessageText,
                Timestamp = message.Timestamp.ToString("yyyy-MM-dd HH:mm:ss"),
                message.MediaType,
                message.FileUrl,
                ReplyToMessageId = message.ReplyToMessageId?.ToString()
            });

            _logger.LogInformation($"Wiadomość wysłana do kanału {channelId} przez {senderId}.");
        }

        // Metoda do wysyłania wskaźników pisania
        public async Task SendTypingIndicator(Guid channelId)
        {
            var senderId = Context.User?.FindFirstValue(ClaimTypes.NameIdentifier);
            var senderName = Context.User?.Identity?.Name;
            if (!string.IsNullOrEmpty(senderId) && !string.IsNullOrEmpty(senderName))
            {
                // Wyślij wskaźnik do wszystkich w kanale, z wyłączeniem wysyłającego
                await Clients.GroupExcept($"Channel-{channelId}", Context.ConnectionId).SendAsync("TypingIndicator", senderId, senderName, channelId);
            }
        }

        // Metoda do wysyłania potwierdzeń odczytu
        public async Task MarkMessageAsRead(Guid messageId, Guid channelId)
        {
            var userId = Context.User?.FindFirstValue(ClaimTypes.NameIdentifier);
            if (string.IsNullOrEmpty(userId)) return;

            // W rzeczywistości należałoby zapisać to w bazie danych
            // np. do tabeli MessageReads (MessageId, UserId, ReadTimestamp)
            _logger.LogInformation($"Wiadomość {messageId} w kanale {channelId} oznaczona jako przeczytana przez {userId}.");

            // Możesz również wysłać powiadomienie do nadawcy wiadomości
            var message = await _dbContext.Messages.FindAsync(messageId);
            if (message != null && message.SenderId != userId)
            {
                await Clients.User(message.SenderId).SendAsync("MessageReadConfirmation", messageId, userId);
            }
        }

        // Metoda do tworzenia nowego kanału
        public async Task CreateChannel(string channelName, string channelType, Guid? projectId = null)
        {
            var creatorId = Context.User?.FindFirstValue(ClaimTypes.NameIdentifier);
            var organizationIdClaim = Context.User?.FindFirstValue("OrganizationId");
            var currentProjectIdClaim = Context.User?.FindFirstValue("ProjectId");

            if (string.IsNullOrEmpty(creatorId) || string.IsNullOrEmpty(organizationIdClaim) || string.IsNullOrEmpty(currentProjectIdClaim))
            {
                _logger.LogWarning("CreateChannel: Brak wymaganych informacji o użytkowniku/organizacji/projekcie.");
                await Clients.Caller.SendAsync("ReceiveError", "Nie można utworzyć kanału: brak informacji o użytkowniku.");
                return;
            }

            Guid organizationId = Guid.Parse(organizationIdClaim);
            Guid actualProjectId = projectId ?? Guid.Parse(currentProjectIdClaim); // Użyj podanego ID projektu lub domyślnego

            var newChannel = new Channel
            {
                Id = Guid.NewGuid(),
                Name = channelName,
                Type = channelType,
                OrganizationId = organizationId,
                ProjectId = actualProjectId
            };

            _dbContext.Channels.Add(newChannel);
            await _dbContext.SaveChangesAsync();

            // Dodaj twórcę jako członka kanału
            _dbContext.ChannelMembers.Add(new ChannelMember
            {
                ChannelId = newChannel.Id,
                UserId = creatorId,
                RoleInChannel = "admin" // Twórca jest adminem kanału
            });
            await _dbContext.SaveChangesAsync();

            // Poinformuj wszystkich w organizacji/projekcie o nowym kanale
            await Clients.Group($"Org-{organizationId}").SendAsync("NewChannelCreated", new
            {
                newChannel.Id,
                newChannel.Name,
                newChannel.Type,
                newChannel.OrganizationId,
                newChannel.ProjectId
            });

            // Dodaj twórcę do grupy SignalR dla nowego kanału (tylko jeśli jest online)
            await Groups.AddToGroupAsync(Context.ConnectionId, $"Channel-{newChannel.Id}");

            _logger.LogInformation($"Kanał '{channelName}' (ID: {newChannel.Id}) utworzony przez {creatorId}.");
            await Clients.Caller.SendAsync("ChannelCreatedSuccessfully", newChannel.Id, newChannel.Name);
        }

        // Metoda do dodawania użytkownika do kanału
        public async Task AddUserToChannel(Guid channelId, string userIdToAdd)
        {
            var adminId = Context.User?.FindFirstValue(ClaimTypes.NameIdentifier);
            var organizationIdClaim = Context.User?.FindFirstValue("OrganizationId");
            var projectIdClaim = Context.User?.FindFirstValue("ProjectId");

            if (string.IsNullOrEmpty(adminId) || string.IsNullOrEmpty(organizationIdClaim) || string.IsNullOrEmpty(projectIdClaim))
            {
                _logger.LogWarning("AddUserToChannel: Brak wymaganych informacji o użytkowniku/organizacji/projekcie.");
                await Clients.Caller.SendAsync("ReceiveError", "Brak wymaganych informacji o użytkowniku.");
                return;
            }

            Guid organizationId = Guid.Parse(organizationIdClaim);
            Guid projectId = Guid.Parse(projectIdClaim);

            // Sprawdź uprawnienia administratora w kanale
            var channelMember = await _dbContext.ChannelMembers
                .FirstOrDefaultAsync(cm => cm.ChannelId == channelId && cm.UserId == adminId && cm.RoleInChannel == "admin");

            if (channelMember == null)
            {
                _logger.LogWarning($"Użytkownik {adminId} próbował dodać użytkownika do kanału {channelId} bez uprawnień administratora.");
                await Clients.Caller.SendAsync("ReceiveError", "Nie masz uprawnień administratora do tego kanału.");
                return;
            }

            // Sprawdź, czy dodawany użytkownik należy do tej samej organizacji/projektu (lub uprawnionej)
            var userToAdd = await _dbContext.Users
                .FirstOrDefaultAsync(u => u.Id == userIdToAdd &&
                                         u.OrganizationId == organizationId &&
                                         u.ProjectId == projectId); // Proste sprawdzenie dla projektu

            if (userToAdd == null)
            {
                _logger.LogWarning($"Użytkownik {userIdToAdd} nie należy do tej samej organizacji/projektu lub nie istnieje.");
                await Clients.Caller.SendAsync("ReceiveError", "Użytkownik nie należy do tej samej organizacji/projektu lub nie istnieje.");
                return;
            }

            // Sprawdź, czy użytkownik nie jest już członkiem kanału
            var existingMember = await _dbContext.ChannelMembers
                .AnyAsync(cm => cm.ChannelId == channelId && cm.UserId == userIdToAdd);

            if (existingMember)
            {
                _logger.LogWarning($"Użytkownik {userIdToAdd} jest już członkiem kanału {channelId}.");
                await Clients.Caller.SendAsync("ReceiveError", "Użytkownik jest już członkiem tego kanału.");
                return;
            }

            _dbContext.ChannelMembers.Add(new ChannelMember
            {
                ChannelId = channelId,
                UserId = userIdToAdd,
                RoleInChannel = "member"
            });
            await _dbContext.SaveChangesAsync();

            // Poinformuj członków kanału o dodaniu nowego użytkownika
            await Clients.Group($"Channel-{channelId}").SendAsync("UserAddedToChannel", channelId, userIdToAdd, userToAdd.UserName);
            
            // Poinformuj dodanego użytkownika, że został dodany do kanału
            var channelName = (await _dbContext.Channels.FindAsync(channelId))?.Name ?? "Nieznany kanał";
            await Clients.User(userIdToAdd).SendAsync("YouWereAddedToChannel", channelId, channelName);

            _logger.LogInformation($"Użytkownik {userIdToAdd} dodany do kanału {channelId} przez {adminId}.");
        }
    }
}