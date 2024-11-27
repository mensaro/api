using System.ComponentModel.DataAnnotations;
using System.Text.Json.Serialization;

namespace Api2.Models
{
    public class Genre
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        [JsonIgnore]
        public ICollection<Game>? Games { get; set; }
    }
}
