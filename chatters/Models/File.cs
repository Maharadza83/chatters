// -----------------------------------------------------------------------------
// Plik: Models/File.cs
// Opis: Model reprezentujący metadane przesłanego pliku.
// -----------------------------------------------------------------------------
using System; // Dodane dla Guid i DateTime

namespace ChatApp.Backend.Models
{
    public class File
    {
        public Guid Id { get; set; }
        public string FileName { get; set; } = null!;
        public string FilePath { get; set; } = null!; // Ścieżka/URL w Blob Storage
        public string ContentType { get; set; } = null!;
        public long FileSize { get; set; }
        public DateTime UploadTimestamp { get; set; } = DateTime.UtcNow;

        public string UploaderId { get; set; } = null!;
        public ApplicationUser Uploader { get; set; } = null!;

        public Guid MessageId { get; set; } // Link do wiadomości, w której plik został udostępniony
        public Message Message { get; set; } = null!;

        // Kolumny dla wielodostępności
        public Guid OrganizationId { get; set; }
        public Guid ProjectId { get; set; }
    }
}