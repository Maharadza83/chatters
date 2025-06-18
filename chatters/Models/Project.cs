// -----------------------------------------------------------------------------
// Plik: Models/Project.cs
// Opis: Model reprezentujący projekt w ramach organizacji.
// -----------------------------------------------------------------------------
using System; // Dodane dla Guid
using System.Collections.Generic; // Dodane dla ICollection

namespace ChatApp.Backend.Models
{
    public class Project
    {
        public Guid Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;

        public Guid OrganizationId { get; set; }
        public Organization Organization { get; set; } = null!;

        public ICollection<ApplicationUser> Users { get; set; } = new List<ApplicationUser>();
    }
}