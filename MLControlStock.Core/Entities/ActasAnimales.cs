using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FundaGes.Core.Entities
{
    public partial class ActasAnimales:IActasAnimales
    {
        public string ActasCodigo { get; set; }
        public int AnimalesID { get; set; }
        public string AnimalesCodigo { get; set; }
        public string AnimalesNombre { get; set; }
        public int? Cantidad { get; set; }       

        public virtual Actas ActasCodigoNavigation { get; set; }
    }
}
