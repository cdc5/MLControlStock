using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FundaGes.Core.Entities
{
    public partial class Especies
    {
        public Especies()
        {
            Animales = new HashSet<Animales>();
        }

        public int Id { get; set; }
        public int? Codigo { get; set; }
        public string Nombre { get; set; }

        public virtual ICollection<Animales> Animales { get; set; }
    }
}
