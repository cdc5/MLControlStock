using System;
using System.Collections.Generic;
using System.Text;

namespace MLControlStock.Core.ApiClient.Dtos
{
    public class ItemResponse
    {
        public string id { get; set; }
        public ShippingResponse shipping { get; set; }
    }
}
