using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using FundaGes.Core.ApiClient.Content;
using FundaGes.Core.ApiClient.Dtos;


namespace FundaGes.Core.Interfaces
{
    public interface IApiClient
    {
        Task Test();
        //Task<ApiClientResponse<ApiCampañasDto>> Campañas(TokenSenasaContent tokenContent);
        Task<List<ApiActasDto>> Actas(ActasContent ActasContent);
        Task<List<ApiActasPendientesDto>> ActasPendientes(ActasPendientesContent ActasPendientesContent);
        Task<List<ApiActasPendientesDto>> Acta(ActaContent ActaContent);
        Task<string> ConfirmarActa(ConfirmarActaContent ConfirmarActaContent);
        Task<string> AnularActa(AnularActaContent AnularActaContent);        
        Task<string> GuardarActa(GuardarActaContent NuevaActaContent);
        Task<List<ApiVacunasDto>> Vacunas(TokenSenasaContent tokenContent);
        Task<List<ApiAnimalesDto>> CategoriasAnimales(TokenSenasaContent tokenContent);
        //Task<ApiClientResponse<ApiTiposIdentificacionDto>> TiposIdentificacion(TokenSenasaContent tokenContent);

    }
}
