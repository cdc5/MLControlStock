using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.DTOs
{
    public class TurnosDtoOut
    {
        public int Id { get; set; }
        public int? Estado { get; set; }
        public string EstadoNombre { get; set; }
        public DateTime? FechaTurnoVacunacion { get; set; }
        public DateTime? HoraTurnoVacunacion { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public int? FundacionId { get; set; }
        public int? VacunadorId { get; set; }
        public int? CantAftosa { get; set; }
        public int? CantBruselosis { get; set; }
        public int? UsuarioCreador { get; set; }
        public string EstablecimientoId { get; set; }
        public string FundacionCuit { get; set; }
        public string VacunadorCuit { get; set; }
        public string VacunadorNombre { get; set; }
        public string EstablecimientoNombre { get; set; }
        public List<string> Renspas { get; set; }
    }
}
