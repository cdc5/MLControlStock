using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.DTOs
{
    public class EntregaRecepcionVacunaDto
    {
        public int? TurnosId { get; set; }
        public int VacunasStockId { get; set; }
        public int? CantidadEntregada { get; set; }
        public decimal? TemperaturaSalida { get; set; }
        public DateTime? FechaDevolucion { get; set; }
        public DateTime? FechaEntrega { get; set; }
        public int? CantidadDevolucion { get; set; }
        public decimal? TemperaturaDevolucion { get; set; }
        public string VacunadorCuit { get; set; }
        public string VacunadorNombre { get; set; }
        public bool EsEntrega { get; set; }

    }
}
