using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FundaGes.Core.Entities
{
    public partial class Subcentros
    {
        public Subcentros()
        {
            Heladeras = new HashSet<Heladeras>();
            VacunasStock = new HashSet<VacunasStock>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }
        public int? FundacionId { get; set; }

        public virtual Fundaciones Fundacion { get; set; }
        public virtual ICollection<Heladeras> Heladeras { get; set; }
        public virtual ICollection<VacunasStock> VacunasStock { get; set; }
    }
}
