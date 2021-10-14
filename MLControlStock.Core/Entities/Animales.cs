using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FundaGes.Core.Entities
{
    public partial class Animales
    {
        public int id { get; set; }
        public string Codigo { get; set; }
        public int? EspecieId { get; set; }
        public string Nombre { get; set; }
        public int? Orden { get; set; }
        public int? UmId { get; set; }
        public int? UmCodigo { get; set; }
        public string UmNombre { get; set; }

        public virtual Especies Especie { get; set; }
    }
}
