// -----------------------------------------------------------------------------
// Plik: Models/Message.cs
// Opis: Model reprezentujący pojedynczą wiadomość w czacie.
// -----------------------------------------------------------------------------
using System; // Dodane dla Guid i DateTime

namespace ChatApp.Backend.Models
{
    public class Message
    {
        public Guid Id { get; set; }
        public string SenderId { get; set; } = null!;
        public ApplicationUser Sender { get; set; } = null!;

        public Guid ChannelId { get; set; }
        public Channel Channel { get; set; } = null!;

        public string MessageText { get; set; } = string.Empty;
        public DateTime Timestamp { get; set; } = DateTime.UtcNow;
        public string? MediaType { get; set; } // np. "text", "image", "video", "document"
        public string? FileUrl { get; set; } // URL do pliku w Blob Storage

        public Guid? ReplyToMessageId { get; set; } // Dla wątków wiadomości
        public Message? ReplyToMessage { get; set; }

        // Kolumny dla wielodostępności (zawsze obecne w danych, filtrowane na poziomie zapytań)
        public Guid OrganizationId { get; set; }
        public Guid ProjectId { get; set; }
    }
}