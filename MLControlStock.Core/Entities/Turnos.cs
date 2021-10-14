using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FundaGes.Core.Entities
{
    public partial class Turnos
    {
        public Turnos()
        {
            TurnosRenspas = new HashSet<TurnosRenspas>();
            TurnosVacunas = new HashSet<TurnosVacunas>();
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

        public virtual Establecimiento Establecimiento { get; set; }
        public virtual Estados EstadoNavigation { get; set; }
        public virtual Fundaciones Fundacion { get; set; }
        public virtual Vacunadores Vacunador { get; set; }
        public virtual ICollection<TurnosRenspas> TurnosRenspas { get; set; }
        public virtual ICollection<TurnosVacunas> TurnosVacunas { get; set; }
    }
}
