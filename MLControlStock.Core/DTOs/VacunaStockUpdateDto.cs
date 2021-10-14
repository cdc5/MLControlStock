using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.DTOs
{
    public class VacunaStockUpdateDto
    {
        public int Id { get; set; }
        public int? Cantidad { get; set; }
        public int? Partida { get; set; }
        public DateTime? FechaVencimiento { get; set; }
    }
}
