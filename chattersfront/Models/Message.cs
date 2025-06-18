// -----------------------------------------------------------------------------
// Plik: chattersfront/Models/Message.cs
// Opis: Model reprezentujący wiadomość czatu po stronie frontendu.
// -----------------------------------------------------------------------------
using System; // Dodane dla Guid

namespace chattersfront.Models
{
    public class Message
    {
        public Guid Id { get; set; }
        public string SenderId { get; set; } = null!;
        public string SenderName { get; set; } = null!; // Dla wygody wyświetlania
        public Guid ChannelId { get; set; }
        public string MessageText { get; set; } = null!;
        public DateTime Timestamp { get; set; }
        public string? MediaType { get; set; }
        public string? FileUrl { get; set; }
        public Guid? ReplyToMessageId { get; set; }
    }

    // Model odwzorowujący to, co dostajesz z backendu SignalR
    public class BackendMessage
    {
        public Guid Id { get; set; }
        public string SenderId { get; set; } = null!;
        public string SenderName { get; set; } = null!;
        public Guid ChannelId { get; set; }
        public string MessageText { get; set; } = null!;
        public string Timestamp { get; set; } = null!; // Backend wysyła jako string
        public string? MediaType { get; set; }
        public string? FileUrl { get; set; }
        public string? ReplyToMessageId { get; set; } // Backend wysyła jako string
    }
}