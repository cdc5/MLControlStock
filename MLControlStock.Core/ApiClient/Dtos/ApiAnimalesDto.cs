using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.ApiClient.Dtos
{
    public class ApiAnimalesDto
    {
        public string codigo { get; set; }
        public string nombre { get; set; }
        public ApiEspecieDto especie { get; set; }
        public int orden { get; set; }
        public ApiUnidadDeMedidaDto unidadDeMedida { get;set;}
        public int id { get; set; }
    }
}
