using System.ComponentModel.DataAnnotations;

namespace Api1.Models
{
    public class Juego
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "El título es obligatorio")]
        [StringLength(15, MinimumLength = 5, ErrorMessage = "El título debe tener entre 5 y 15 caracteres")]
        public string Titulo { get; set; }

        [Required(ErrorMessage = "El género es obligatorio")]
        [StringLength(12, MinimumLength = 2, ErrorMessage = "El género debe tener entre 2 y 12 caracteres")]
        public string Genero { get; set; }
    }
}
