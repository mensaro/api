using Microsoft.AspNetCore.Mvc;
using Api1.Models;
using System.Collections.Generic;
using System.Linq;


// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Api1.Controllers
{


    
    
        
     [Route("api/[controller]")]
    [ApiController]

     public class JuegosController : ControllerBase
    {

        private static List<Juego> juegos = new List<Juego>
    {
            new Juego { Id = 1, Titulo = "FIFA 23", Genero = "Deporte" },
            new Juego { Id = 2, Titulo = "Minecraft", Genero = "Aventura" },
            new Juego { Id = 3, Titulo = "Forza Horizon", Genero = "Carreras" }
    };



        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<IEnumerable<Juego>> Get()
        {
            return Ok(juegos);
        }

        // GET: api/juegos/{id}
        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public ActionResult<Juego> GetById(int id)
        {
            var juego = juegos.FirstOrDefault(j => j.Id == id);
            if (juego == null)
                return NotFound();

            return Ok(juego);
        }

        // POST: api/juegos
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public ActionResult<Juego> Create([FromBody] Juego juego)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            juego.Id = juegos.Max(j => j.Id) + 1;
            juegos.Add(juego);

            return CreatedAtAction(nameof(GetById), new { id = juego.Id }, juego);
        }

        // PUT: api/juegos/{id}
        [HttpPut("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public IActionResult Update(int id, [FromBody] Juego juego)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var existingJuego = juegos.FirstOrDefault(j => j.Id == id);
            if (existingJuego == null)
                return NotFound();

            existingJuego.Titulo = juego.Titulo;
            existingJuego.Genero = juego.Genero;

            return Ok(existingJuego);
        }

        // DELETE: api/juegos/{id}
        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public IActionResult Delete(int id)
        {
            var juego = juegos.FirstOrDefault(j => j.Id == id);
            if (juego == null)
                return NotFound();

            juegos.Remove(juego);

            return NoContent();
        }
    }
}
