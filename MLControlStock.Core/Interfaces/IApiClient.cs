using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using MLControlStock.Core.ApiClient.Content;
using MLControlStock.Core.ApiClient.Dtos;


namespace MLControlStock.Core.Interfaces
{
    public interface IApiClient
    {
        //Task Test();
        //Task<ApiClientResponse<ApiCampañasDto>> Campañas(TokenSenasaContent tokenContent);
        Task<ItemResponse> Items(string Producto);
    }
}
