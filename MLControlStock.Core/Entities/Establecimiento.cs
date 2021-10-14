using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FundaGes.Core.Entities
{
    public partial class Establecimiento
    {
        public Establecimiento()
        {
            Renspas = new HashSet<Renspas>();
            Turnos = new HashSet<Turnos>();
        }

        public string Id { get; set; }
        public string Titular { get; set; }
        public int? FundacionId { get; set; }
        public string Nombre { get; set; }

        public virtual Fundaciones Fundacion { get; set; }
        public virtual ICollection<Renspas> Renspas { get; set; }
        public virtual ICollection<Turnos> Turnos { get; set; }
    }
}
