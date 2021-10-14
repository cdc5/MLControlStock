using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.DTOs
{
    public class ActaDto
    {
        public long?  Id { get; set; }
        public string Renspa { get; set; }
        public DateTime? FechaVacunacion { get; set; }
        public string Campania { get; set; }
        public string Codigo { get; set; }
        public string Vacuna { get; set; }
        public string Serie { get; set; }
        public string Dosis { get; set; }
        public bool? Total { get; set; }
        public string CuitVacunador { get; set; }
        public string VacunaBrucelosis { get; set; }
        public string SerieBrucelosis { get; set; }
        public int? DosisBrucelosis { get; set; }
        public bool? Carbunclo { get; set; }
        public int? TernerasBrucelosis { get; set; }
        public int? ternerasBubalinasBrucelosis { get; set; }
        public List<StockDto> Stock { get; set; }
        public List<StockDto> StockDDJJ { get; set; }
        public string identificacion { get; set; }
        public string Estado { get; set; }
    }
}
