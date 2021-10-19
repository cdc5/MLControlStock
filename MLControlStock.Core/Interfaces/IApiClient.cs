using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using MLControlStock.Core.ApiClient.Dtos;


namespace MLControlStock.Core.Interfaces
{
    public interface IApiClient
    {
        Task<ItemResponse> Items(string Producto);
    }
}
