using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.DTOs
{
    public class StockDto
    {
        public int cantidad { get; set; }
        public CategoriaDto categoria { get; set; }
    }
}
