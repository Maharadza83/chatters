// -----------------------------------------------------------------------------
// Plik: Data/ApplicationDbContext.cs
// Opis: Kontekst bazy danych Entity Framework Core, rozszerzający IdentityDbContext
//       do zarządzania tabelami Identity oraz niestandardowymi tabelami aplikacji.
// -----------------------------------------------------------------------------
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using ChatApp.Backend.Models;
using System; // Dodane dla Guid
using File = ChatApp.Backend.Models.File; // Rozwiązanie niejednoznaczności dla klasy File

namespace ChatApp.Backend.Data
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        // Dodanie DbSet dla niestandardowych modeli danych
        public DbSet<Organization> Organizations { get; set; }
        public DbSet<Project> Projects { get; set; }
        public DbSet<Message> Messages { get; set; }
        public DbSet<Channel> Channels { get; set; }
        // Używamy aliasu File, aby uniknąć kolizji z System.IO.File
        public DbSet<File> Files { get; set; } // Dla metadanych plików
        public DbSet<ChannelMember> ChannelMembers { get; set; }


        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            // Konfiguracja relacji dla ChannelMember (klucz złożony)
            builder.Entity<ChannelMember>()
                .HasKey(cm => new { cm.ChannelId, cm.UserId });

            builder.Entity<ChannelMember>()
                .HasOne(cm => cm.Channel)
                .WithMany(c => c.ChannelMembers)
                .HasForeignKey(cm => cm.ChannelId);

            builder.Entity<ChannelMember>()
                .HasOne(cm => cm.User)
                .WithMany() // Brak kolekcji ChannelMembers w ApplicationUser, jeśli nie jest potrzebna dwukierunkowa relacja
                .HasForeignKey(cm => cm.UserId);

            // Konfiguracja relacji dla Message ReplyToMessage (self-referencing)
            builder.Entity<Message>()
                .HasOne(m => m.ReplyToMessage)
                .WithMany() // Wiadomość może mieć wiele odpowiedzi, ale w uproszczeniu nie śledzimy tego jako kolekcji
                .HasForeignKey(m => m.ReplyToMessageId)
                .IsRequired(false); // ReplyToMessageId jest opcjonalne

            // Wdrożenie Global Query Filters dla wielodostępności
            // Upewnij się, że dane są filtrowane na podstawie OrganizationId/ProjectId
            // Ta implementacja jest uproszczona i wymaga dynamicznego kontekstu użytkownika
            // W rzeczywistej aplikacji, OrganizationId/ProjectId byłoby pobierane z kontekstu uwierzytelnionego użytkownika
            // Przykład (zakłada, że masz sposób na uzyskanie OrganizationId z bieżącego użytkownika):
            /*
            builder.Entity<Message>().HasQueryFilter(m => m.OrganizationId == _currentOrganizationId);
            builder.Entity<Channel>().HasQueryFilter(c => c.OrganizationId == _currentOrganizationId);
            // i tak dalej dla innych encji specyficznych dla najemcy
            */

            // Dodatkowe indeksy dla wydajności zapytań czatu
            builder.Entity<Message>()
                .HasIndex(m => new { m.ChannelId, m.Timestamp }); // Dla szybkiego pobierania wiadomości z kanału
            builder.Entity<Message>()
                .HasIndex(m => m.OrganizationId); // Dla filtrowania po organizacji
            builder.Entity<Message>()
                .HasIndex(m => m.ProjectId); // Dla filtrowania po projekcie
        }
    }
}