// -----------------------------------------------------------------------------
// Plik: Controllers/FilesController.cs
// Opis: Kontroler do obsługi przesyłania plików.
//       W tym przykładzie tylko szkielet, rzeczywista logika integracji z Azure Blob Storage
//       wymagałaby instalacji odpowiednich pakietów i implementacji logiki przesyłania.
// -----------------------------------------------------------------------------
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using ChatApp.Backend.Models;
using ChatApp.Backend.Data;
using Microsoft.EntityFrameworkCore;
using System; // Dodane dla Guid
using System.IO; // Dodane dla Path
using System.Threading.Tasks; // Dodane dla Task
using Microsoft.Extensions.Logging; // Dodane dla ILogger

namespace ChatApp.Backend.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    [Authorize] // Wszyscy użytkownicy muszą być zalogowani
    public class FilesController : ControllerBase
    {
        private readonly ILogger<FilesController> _logger;
        private readonly ApplicationDbContext _dbContext;

        public FilesController(ILogger<FilesController> logger, ApplicationDbContext dbContext)
        {
            _logger = logger;
            _dbContext = dbContext;
        }

        [HttpPost("upload")]
        public async Task<IActionResult> UploadFile(IFormFile file)
        {
            if (file == null || file.Length == 0)
            {
                return BadRequest("Brak pliku do przesłania.");
            }

            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var organizationIdClaim = User.FindFirstValue("OrganizationId");
            var projectIdClaim = User.FindFirstValue("ProjectId");

            if (string.IsNullOrEmpty(userId) || string.IsNullOrEmpty(organizationIdClaim) || string.IsNullOrEmpty(projectIdClaim))
            {
                return Unauthorized("Brak wymaganych informacji o użytkowniku/organizacji/projekcie.");
            }

            Guid organizationId = Guid.Parse(organizationIdClaim);
            Guid projectId = Guid.Parse(projectIdClaim);

            // Tutaj logika przesyłania pliku do Azure Blob Storage
            // W rzeczywistym scenariuszu:
            // 1. Zainstaluj pakiet Azure.Storage.Blobs
            // 2. Skonfiguruj BlobServiceClient
            // 3. Utwórz kontener (jeśli nie istnieje)
            // 4. Prześlij plik do Blob Storage
            // 5. Zapisz metadane pliku (w tym URL) do bazy danych

            // Przykład ścieżki do pliku w Blob Storage (do celów demonstracyjnych)
            var fileExtension = Path.GetExtension(file.FileName);
            var uniqueFileName = $"{Guid.NewGuid()}{fileExtension}";
            var blobPath = $"{organizationId}/{projectId}/{uniqueFileName}"; // Ścieżka z uwzględnieniem najemcy
            var fileUrl = $"https://yourstorageaccount.blob.core.windows.net/{blobPath}"; // Zastąp swoim URL

            _logger.LogInformation($"Przesyłanie pliku: {file.FileName} przez użytkownika {userId} do {blobPath}");

            try
            {
                // Symulacja zapisu do bazy danych (w rzeczywistości po udanym przesłaniu do Blob Storage)
                var newFileRecord = new ChatApp.Backend.Models.File // Pełne kwalifikowanie nazwy, aby uniknąć niejednoznaczności z System.IO.File
                {
                    FileName = file.FileName,
                    FilePath = fileUrl, // To będzie rzeczywisty URL w Blob Storage
                    ContentType = file.ContentType,
                    FileSize = file.Length,
                    UploaderId = userId,
                    OrganizationId = organizationId,
                    ProjectId = projectId,
                    MessageId = Guid.Empty // Musisz to zaktualizować po wysłaniu wiadomości z załącznikiem
                };
                _dbContext.Files.Add(newFileRecord);
                await _dbContext.SaveChangesAsync();

                return Ok(new { FileName = file.FileName, FileUrl = fileUrl, Message = "Plik przesłany pomyślnie (symulacja)." });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Błąd podczas przesyłania pliku.");
                return StatusCode(500, "Wystąpił błąd podczas przesyłania pliku.");
            }
        }
    }
}