using System;
using System.Collections.Generic;
using System.Text;

namespace MLControlStock.Core.ApiClient.Dtos
{
    public class ApiActasDto
    {
        public int id { get; set; }
        public string codigo { get; set; }
        public string cuitVacunador { get; set; }
        public string fechaVacunacion { get; set; }
        public string nombreVacunador { get; set; }
        public bool? requiereConfirmacion { get; set; }
        public string fechaCarga { get; set; }
        public string cuitTitular { get; set; }
        public string nombreTitular { get; set; }
        public string renspa { get; set; }
        public string fechaConfirmacion { get; set; } 
    }
}

