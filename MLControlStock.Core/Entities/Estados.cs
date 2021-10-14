using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FundaGes.Core.Entities
{
    public partial class Estados
    {
        public Estados()
        {
            Actas = new HashSet<Actas>();
            Turnos = new HashSet<Turnos>();
            VacunasStock = new HashSet<VacunasStock>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }

        public virtual ICollection<Actas> Actas { get; set; }
        public virtual ICollection<Turnos> Turnos { get; set; }
        public virtual ICollection<VacunasStock> VacunasStock { get; set; }
    }
}
