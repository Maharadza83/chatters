// -----------------------------------------------------------------------------
// Plik: Models/ApplicationUser.cs
// Opis: Rozszerzony model użytkownika ASP.NET Core Identity.
// -----------------------------------------------------------------------------
using Microsoft.AspNetCore.Identity;
using System; // Dodane dla Guid

namespace ChatApp.Backend.Models
{
    public class ApplicationUser : IdentityUser
    {
        // Identyfikator organizacji, do której należy użytkownik
        public Guid? OrganizationId { get; set; }
        // Identyfikator projektu, do którego należy użytkownik (opcjonalnie, jeśli użytkownik może być przypisany do wielu projektów,
        // wymagałoby to tabeli łączącej lub listy GUID)
        public Guid? ProjectId { get; set; }

        // Możesz dodać inne niestandardowe właściwości, np.
        public string? FullName { get; set; }
        public string? AvatarUrl { get; set; }
    }
}