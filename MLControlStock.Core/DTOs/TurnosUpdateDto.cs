using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.DTOs
{
    public class TurnosUpdateDto
    {
        public string EstadoNombre { get; set; }
        public DateTime? Fecha { get; set; }
        public DateTime? Hora { get; set; }
        public string cuitVacunador { get; set; }
        public string nombreVacunador { get; set; }
     
     
    }
}
