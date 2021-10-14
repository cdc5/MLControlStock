using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FundaGes.Core.Entities
{
    public partial class Renspas
    {
        public Renspas()
        {
            TurnosRenspas = new HashSet<TurnosRenspas>();
        }

        public string Renspa { get; set; }
        public string EstablecimientoId { get; set; }
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

        public virtual Establecimiento Establecimiento { get; set; }
        public virtual ICollection<TurnosRenspas> TurnosRenspas { get; set; }
    }
}
