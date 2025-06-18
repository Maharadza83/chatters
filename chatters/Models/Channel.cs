// -----------------------------------------------------------------------------
// Plik: Models/Channel.cs
// Opis: Model reprezentujący kanał czatu (grupowy, bezpośredni, projektowy).
// -----------------------------------------------------------------------------
using System; // Dodane dla Guid
using System.Collections.Generic; // Dodane dla ICollection

namespace ChatApp.Backend.Models
{
    public class Channel
    {
        public Guid Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Type { get; set; } = string.Empty; // np. "direct", "group", "project"

        public Guid OrganizationId { get; set; }
        public Guid ProjectId { get; set; } // Kanały mogą być specyficzne dla projektu

        public ICollection<Message> Messages { get; set; } = new List<Message>();
        public ICollection<ChannelMember> ChannelMembers { get; set; } = new List<ChannelMember>();
    }
}