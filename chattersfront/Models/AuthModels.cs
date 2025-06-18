// -----------------------------------------------------------------------------
// Plik: chattersfront/Models/AuthModels.cs
// Opis: Modele DTO dla komunikacji z API uwierzytelniania.
// -----------------------------------------------------------------------------
using System; // Dodane dla Guid
using System.Collections.Generic; // Dodane dla List

namespace chattersfront.Models
{
    public class LoginRequest
    {
        public string Email { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
    }

    public class LoginResponse
    {
        public string Token { get; set; } = string.Empty;
        public string UserId { get; set; } = string.Empty;
        public string UserName { get; set; } = string.Empty;
        public Guid? OrganizationId { get; set; }
        public Guid? ProjectId { get; set; }
        public List<string> Roles { get; set; } = new List<string>();
    }

    public class RegisterRequest
    {
        public string Email { get; set; } = null!;
        public string Password { get; set; } = null!;
        public string FullName { get; set; } = null!;
        public string OrganizationName { get; set; } = null!;
        public string ProjectName { get; set; } = null!;
    }
}