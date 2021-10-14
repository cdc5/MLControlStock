using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.ApiClient.Dtos
{
    public class ApiStockDto
    {
        public string nombreCategoria { get; set; }
        public int cantidad { get; set; }
        public string codigoCategoria { get; set; }
        public string idCategoria { get; set; }
    }
}
