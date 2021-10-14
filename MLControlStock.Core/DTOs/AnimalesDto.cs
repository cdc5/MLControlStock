using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.DTOs
{
    public class AnimalesDto
    {
        public string Codigo { get; set; }
        public int? EspecieId { get; set; }
        public string Nombre { get; set; }
        public int? Orden { get; set; }
        public int? UmId { get; set; }
        public int? UmCodigo { get; set; }
        public string UmNombre { get; set; }
    }
}
