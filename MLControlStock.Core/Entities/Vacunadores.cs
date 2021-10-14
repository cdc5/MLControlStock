using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FundaGes.Core.Entities
{
    public partial class Vacunadores
    {
        public Vacunadores()
        {
            Turnos = new HashSet<Turnos>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public string Cuit { get; set; }
        public string TokenSenasa { get; set; }
        public int? UsuarioId { get; set; }
        public int? FundacionId { get; set; }

        public virtual Fundaciones Fundacion { get; set; }
        public virtual Usuarios Usuario { get; set; }
        public virtual ICollection<Turnos> Turnos { get; set; }
    }
}
