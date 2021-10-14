using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.DTOs
{
    public class VacunaStockDto
    {
        public int? VacunasId { get; set; }
        public int? Cantidad { get; set; }
        public int? Partida { get; set; }
        public int? HeladeraId { get; set; }
        public DateTime? FechaVencimiento { get; set; }
    }
}
