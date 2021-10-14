using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FundaGes.Core.Entities
{
    public partial class Campañas
    {
        public int? Anio { get; set; }
        public string Codigo { get; set; }
        public bool? VacunaSoloDeRiesgo { get; set; }
        public int? NumeroCampania { get; set; }
        public DateTime? Inicio { get; set; }
        public string PlanDeVacunacion { get; set; }
        public bool? EsDeMenores { get; set; }
        public DateTime? Fin { get; set; }
    }
}
