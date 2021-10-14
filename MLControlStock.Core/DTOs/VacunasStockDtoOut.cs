using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.DTOs
{
    public class VacunasStockDtoOut
    {
        public int Id { get; set; }
        public int? VacunasId { get; set; }
        public int? EstadoId { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public DateTime? FechaVencimiento { get; set; }
        public int? HeladeraId { get; set; }
        public int? Cantidad { get; set; }
        public int? Partida { get; set; }
        public int? FundacionId { get; set; }
        public int? SubcentroId { get; set; }

        public string Heladera { get; set; }
        public string Subcentro { get; set; }
        public string  MarcaVacuna { get; set; }
        public string  DescripcionVacuna { get; set; }
    }
}
