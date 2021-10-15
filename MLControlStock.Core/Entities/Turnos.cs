using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace MLControlStock.Core.Entities
{
    public partial class Turnos
    {
        public Turnos()
        {
           
        }

        public int Id { get; set; }
        public int? Estado { get; set; }
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

        
    }
}
