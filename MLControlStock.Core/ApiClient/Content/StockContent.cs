using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.ApiClient.Content
{
    public class StockContent
    {
        public int cantidad { get; set; }
        public CategoriaContent categoria { get; set; }
    }
}
