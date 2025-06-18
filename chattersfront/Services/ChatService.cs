// -----------------------------------------------------------------------------
// Plik: chattersfront/Services/ChatService.cs
// Opis: Usługa do obsługi komunikacji w czasie rzeczywistym za pomocą SignalR.
// -----------------------------------------------------------------------------
using Microsoft.AspNetCore.SignalR.Client;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.JSInterop;
using System;
using chattersfront.Models; // Zmienione z ChatApp.Frontend.Models
using System.Linq; // Dodane dla LINQ

namespace chattersfront.Services
{
    public class ChatService : IAsyncDisposable
    {
        private HubConnection? hubConnection;
        private readonly IJSRuntime _jsRuntime;

        // Zdarzenia do subskrypcji w komponentach Blazor
        public event Action<Message>? OnMessageReceived;
        public event Action<string, string, Guid>? OnTypingIndicator;
        public event Action<Guid, string, string>? OnUserAddedToChannel;
        public event Action<Guid, string>? OnChannelCreatedSuccessfully;
        public event Action<string>? OnReceiveError;

        public ChatService(IJSRuntime jsRuntime)
        {
            _jsRuntime = jsRuntime;
        }

        // Metoda do inicjowania połączenia z SignalR Hub
       // Metoda do inicjowania połączenia z SignalR Hub
public async Task StartConnectionAsync()
{
    if (hubConnection != null && hubConnection.State == HubConnectionState.Connected)
    {
        return; // Połączenie już istnieje
    }

    // Pobierz token JWT z localStorage
    var token = await _jsRuntime.InvokeAsync<string>("localStorage.getItem", "authToken");
    if (string.IsNullOrWhiteSpace(token))
    {
        OnReceiveError?.Invoke("Brak tokena autoryzacji. Zaloguj się ponownie.");
        return;
    }

    // Zdefiniuj adres URL huba w zmiennej
    var hubUrl = "https://localhost:7001/chatHub"; // UPEWNIJ SIĘ, ŻE TO PRAWIDŁOWY ADRES BACKENDU

    // Utwórz HubConnection
    hubConnection = new HubConnectionBuilder()
        .WithUrl(hubUrl, options => // Użyj zmiennej tutaj
        {
            options.AccessTokenProvider = () => Task.FromResult(token);
            // To jest obejście problemu z certyfikatami SSL w debugowaniu na niektórych platformach MAUI
            // W produkcji użyj certyfikatu zaufanego!
            options.HttpMessageHandlerFactory = innerHandler =>
            {
                return new HttpClientHandler { ServerCertificateCustomValidationCallback = HttpClientHandler.DangerousAcceptAnyServerCertificateValidator };
            };
        })
        .WithAutomaticReconnect() // Automatyczne ponowne łączenie
        .Build();

    // Rejestracja handlerów dla wiadomości z huba
    hubConnection.On<BackendMessage>("ReceiveMessage", (backendMessage) =>
    {
        // Mapowanie BackendMessage na Frontend Message
        var message = new Message
        {
            Id = backendMessage.Id,
            SenderId = backendMessage.SenderId,
            SenderName = backendMessage.SenderName,
            ChannelId = backendMessage.ChannelId,
            MessageText = backendMessage.MessageText,
            Timestamp = DateTime.Parse(backendMessage.Timestamp), // Konwertuj string na DateTime
            MediaType = backendMessage.MediaType,
            FileUrl = backendMessage.FileUrl,
            ReplyToMessageId = backendMessage.ReplyToMessageId == null ? (Guid?)null : Guid.Parse(backendMessage.ReplyToMessageId) // Konwertuj string na Guid?
        };
        OnMessageReceived?.Invoke(message);
    });

    hubConnection.On<string, string, Guid>("TypingIndicator", (userId, userName, channelId) =>
    {
        OnTypingIndicator?.Invoke(userId, userName, channelId);
    });

    hubConnection.On<Guid, string, string>("UserAddedToChannel", (channelId, userId, userName) =>
    {
        OnUserAddedToChannel?.Invoke(channelId, userId, userName);
    });

    hubConnection.On<Guid, string>("ChannelCreatedSuccessfully", (channelId, channelName) =>
    {
        OnChannelCreatedSuccessfully?.Invoke(channelId, channelName);
    });

    hubConnection.On<string>("ReceiveError", (errorMessage) =>
    {
        OnReceiveError?.Invoke(errorMessage);
    });

    try
    {
        await hubConnection.StartAsync();
        Console.WriteLine("Połączenie SignalR nawiązane!");
    }
    catch (Exception ex)
    {
        Console.WriteLine($"Błąd połączenia SignalR: {ex.Message}");
        // POPRAWIONA LINIA: Użyj zmiennej hubUrl zamiast nieistniejącej 'options'
        OnReceiveError?.Invoke($"Błąd połączenia z czatem: {ex.Message}. Sprawdź, czy backend działa na {hubUrl}.");
    }
}

        // Metoda do wysyłania wiadomości przez SignalR
        public async Task SendMessage(Guid channelId, string messageText, string? replyToMessageId = null, string? fileUrl = null, string? mediaType = null)
        {
            if (hubConnection?.State == HubConnectionState.Connected)
            {
                await hubConnection.SendAsync("SendMessageToChannel", channelId, messageText, replyToMessageId, fileUrl, mediaType);
            }
            else
            {
                Console.WriteLine("Brak połączenia z hubem SignalR.");
                OnReceiveError?.Invoke("Brak połączenia z czatem. Spróbuj się ponownie połączyć.");
            }
        }
        
        // Metoda do wysyłania wskaźnika pisania
        public async Task SendTypingIndicator(Guid channelId)
        {
            if (hubConnection?.State == HubConnectionState.Connected)
            {
                await hubConnection.SendAsync("SendTypingIndicator", channelId);
            }
        }

        // Metoda do tworzenia kanału przez SignalR
        public async Task CreateChannel(string channelName, string channelType, Guid? projectId = null)
        {
            if (hubConnection?.State == HubConnectionState.Connected)
            {
                await hubConnection.SendAsync("CreateChannel", channelName, channelType, projectId);
            }
            else
            {
                Console.WriteLine("Brak połączenia z hubem SignalR. Nie można utworzyć kanału.");
                OnReceiveError?.Invoke("Brak połączenia z czatem. Nie można utworzyć kanału.");
            }
        }

        // Metoda do dodawania użytkownika do kanału przez SignalR
        public async Task AddUserToChannel(Guid channelId, string userIdToAdd)
        {
             if (hubConnection?.State == HubConnectionState.Connected)
            {
                await hubConnection.SendAsync("AddUserToChannel", channelId, userIdToAdd);
            }
            else
            {
                Console.WriteLine("Brak połączenia z hubem SignalR. Nie można dodać użytkownika.");
                OnReceiveError?.Invoke("Brak połączenia z czatem. Nie można dodać użytkownika.");
            }
        }

        // Zwolnienie zasobów HubConnection
        public async ValueTask DisposeAsync()
        {
            if (hubConnection != null)
            {
                await hubConnection.DisposeAsync();
            }
        }
    }
}