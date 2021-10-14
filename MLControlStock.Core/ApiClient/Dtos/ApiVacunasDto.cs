using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.ApiClient.Dtos
{
    public class ApiVacunasDto
    {
        public int id { get; set; }
        public string codigo { get; set; }
        public string identificador { get; set; }
        public string marca { get; set; }
        public string descripcion { get; set; }                   
    }
}
