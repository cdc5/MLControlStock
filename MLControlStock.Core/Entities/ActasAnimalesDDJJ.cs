using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.Entities
{
    public class ActasAnimalesDDJJ : IActasAnimales
    {
        public string ActasCodigo { get; set; }
        public int AnimalesID { get; set; }
        public string AnimalesCodigo { get; set; }
        public string AnimalesNombre { get; set; }
        
        public int? Cantidad { get; set; }

        public virtual Actas ActasCodigoNavigation { get; set; }
    }
}
