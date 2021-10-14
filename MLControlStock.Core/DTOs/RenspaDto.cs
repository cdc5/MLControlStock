using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.DTOs
{
    public class RenspaDto
    {
        public string Renspa { get; set; }
        public string IdEstablecimiento { get; set; }
        public int? Superficie { get; set; }
        public string Provincia { get; set; }
        public string Partido { get; set; }
        public int? Vacas { get; set; }
        public int? Vaquillonas { get; set; }
        public int? Novillos { get; set; }
        public int? Novillitos { get; set; }
        public int? Terneras { get; set; }
        public int? Terneros { get; set; }
        public int? Toros { get; set; }
        public int? Toritos { get; set; }
        public int? Bueyes { get; set; }
        public int? TotalBovinos { get; set; }
        public decimal? Latitud { get; set; }
        public decimal? Longitud { get; set; }
        public int? CodigoPlan { get; set; }
        public int? FundacionId { get; set; }
        public string Titular { get; set; }
    }
}
