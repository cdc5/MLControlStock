using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FundaGes.Core.Entities
{
    public partial class Vacunas
    {
        public Vacunas()
        {
            VacunasStock = new HashSet<VacunasStock>();
        }

        public int Id { get; set; }
        public string Codigo { get; set; }
        public string Identificador { get; set; }
        public string Marca { get; set; }
        public string Descripcion { get; set; }

        public virtual ICollection<VacunasStock> VacunasStock { get; set; }

        public override string ToString()
        {
            return String.Format("{0} {1}", Descripcion, Marca);
        }
    }
}
