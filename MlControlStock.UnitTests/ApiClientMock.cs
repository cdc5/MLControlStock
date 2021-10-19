using MLControlStock.Core.ApiClient.Dtos;
using MLControlStock.Core.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace MlControlStock.UnitTests
{
    public class ApiClientMock : IApiClient
    {
        //Simula llamado a Api ML, para conocer si el producto esta en deposito (logistic_type = fulfillment)
        public Task<ItemResponse> Items(string Producto)
        {
            var itemResponse = new ItemResponse();
            itemResponse.shipping = new ShippingResponse();
            itemResponse.id = Producto;

            var ProductosFulFillment = new List<String>();
            ProductosFulFillment.Add("MLA813727183");
            ProductosFulFillment.Add("MLA813727184");
            ProductosFulFillment.Add("MLA813727185");
            ProductosFulFillment.Add("MLA813727186");
            ProductosFulFillment.Add("MLA813727187");
            if (ProductosFulFillment.Contains(Producto))
                itemResponse.shipping.logistic_type = "fulfillment";
            else
                itemResponse.shipping.logistic_type = "";
            return Task.FromResult(itemResponse);
        }
    }
}
