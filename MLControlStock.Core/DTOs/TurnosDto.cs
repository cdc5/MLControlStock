 using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.DTOs
{
    public class TurnosDto
    {
        public DateTime? FechaTurnoVacunacion { get; set; }
        public DateTime? HoraTurnoVacunacion { get; set; }
        public int? CantAftosa { get; set; }
        public int? CantBruselosis { get; set; }
        public int UsuarioCreador { get; set; }
        public string UsuarioCreadorCuit { get; set; }
        public string EstablecimientoId { get; set; }
        public string FundacionCuit { get; set; }
        public string VacunadorCuit { get; set; }
        public string VacunadorNombre { get; set; }
        public string EstablecimientoNombre { get; set; }
        public List<String> Renspas { get; set; }
    }
}
