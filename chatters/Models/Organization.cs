// -----------------------------------------------------------------------------
// Plik: Models/Organization.cs
// Opis: Model reprezentujący organizację.
// -----------------------------------------------------------------------------
using System; // Dodane dla Guid
using System.Collections.Generic; // Dodane dla ICollection

namespace ChatApp.Backend.Models
{
    public class Organization
    {
        public Guid Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;

        public ICollection<Project> Projects { get; set; } = new List<Project>();
        public ICollection<ApplicationUser> Users { get; set; } = new List<ApplicationUser>();
    }
}