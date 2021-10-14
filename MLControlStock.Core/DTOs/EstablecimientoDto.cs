using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.DTOs
{
    public class EstablecimientoDto
    {
        public string Id { get; set; }
        public string Titular { get; set; }
        public int? FundacionId { get; set; }
        public string Nombre { get; set; }

        public virtual ICollection<string> Renspas { get; set; }
    }
}
