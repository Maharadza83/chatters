// -----------------------------------------------------------------------------
// Plik: Models/ChannelMember.cs
// Opis: Tabela łącząca Channel i ApplicationUser z rolą użytkownika w kanale.
// -----------------------------------------------------------------------------
using System; // Dodane dla Guid

namespace ChatApp.Backend.Models
{
    public class ChannelMember
    {
        public Guid ChannelId { get; set; }
        public Channel Channel { get; set; } = null!;

        public string UserId { get; set; } = null!;
        public ApplicationUser User { get; set; } = null!;

        public string RoleInChannel { get; set; } = "member"; // np. "member", "admin"
    }
}