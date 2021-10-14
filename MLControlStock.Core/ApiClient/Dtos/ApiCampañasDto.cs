using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.ApiClient.Dtos
{
    public class ApiCampañasDto
    {
        public int? Anio { get; set; }
        public string Codigo { get; set; }
        public bool? VacunaSoloDeRiesgo { get; set; }
        public int? NumeroCampania { get; set; }
        public string Inicio { get; set; }
        public string PlanDeVacunacion { get; set; }
        public bool? EsDeMenores { get; set; }
        public string Fin { get; set; }
    }
}
