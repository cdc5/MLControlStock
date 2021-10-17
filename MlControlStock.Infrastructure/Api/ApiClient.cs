using System;
using System.Collections.Generic;
using System.Text;
using System.Net.Http;
using System.Threading.Tasks;
using MLControlStock.Core.Interfaces;
using System.Net.Http.Headers;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.Diagnostics;
using MLControlStock.Core.ApiClient.Dtos;
using System.Globalization;
using MLControlStock.Core.ApiClient.Content;
using MLControlStock.Core.Exceptions;
using MLControlStock.Core.ApiClient.JsonConverters;
using System.IO;
using System.Net;

namespace MLControlStock.Infrastructure.Api
{
    public class ApiClient : IApiClient
    {
        private readonly IHttpClientFactory _clientFact;

        public ApiClient(IHttpClientFactory IHttpClientFactory)
        {
            _clientFact = IHttpClientFactory;
        }

        //public async Task Test()
        //{

        //    var cliente = _clientFact.CreateClient("TestSenasa");
        //    // var result = await cliente.GetAsync(new Uri($"https://test.senasa.gov.ar/sigsa/seam/resource/rest/actas-fundacion/campanias"));

        //    // Console.WriteLine(result.Content.ReadAsStringAsync().Result);

        //    //Dictionary<string, string> postParams = new Dictionary<string, string>();
        //    //postParams.Add("cuit", "33-64402022-9");
        //    //postParams.Add("wsUsername", "33-64402022-9");
        //    //postParams.Add("wsToken", "61137e75-f1f5-4cbe-9848-888217dee22f");

        //    var token = new
        //    {
        //        cuit = "33-64402022-9",
        //        wsUsername = "33-64402022-9",
        //        wsToken = "61137e75-f1f5-4cbe-9848-888217dee22f"
        //    };

        //    var json = JsonConvert.SerializeObject(token);
        //    var data = new StringContent(json, Encoding.UTF8, "application/json");
        //    var response = await cliente.PostAsync($"/sigsa/seam/resource/rest/actas-fundacion/campanias", data);
        //    var format = "dd/MM/yyyy HH:mm"; // your datetime format
        //    var dateTimeConverter = new IsoDateTimeConverter { DateTimeFormat = format };
        //    var result = JsonConvert.DeserializeObject<ApiClientResponse<ApiCampañasDto>>(await response.Content.ReadAsStringAsync(), dateTimeConverter);
        //    // string result = response.Content.ReadAsStringAsync().Result;
        //    Debug.WriteLine(result);


        //    //HttpRequestMessage requestMessage = new HttpRequestMessage(new HttpMethod("POST"), $"https://test.senasa.gov.ar/sigsa/seam/resource/rest/actas-fundacion/campanias");

        //    //if (postParams != null)
        //    //    requestMessage.Content = new FormUrlEncodedContent(postParams);   // This is where your content gets added to the request body


        //    //HttpResponseMessage response = cliente.SendAsync(requestMessage).Result;

        //    //string apiResponse = response.Content.ReadAsStringAsync().Result;
        //    //try
        //    //{
        //    //    // Attempt to deserialise the reponse to the desired type, otherwise throw an expetion with the response from the api.
        //    //    if (apiResponse != "")
        //    //        return JsonConvert.DeserializeObject<T>(apiResponse);
        //    //    else
        //    //        throw new Exception();
        //    //}
        //    //catch (Exception ex)
        //    //{
        //    //    throw new Exception($"An error ocurred while calling the API. It responded with the following message: {response.StatusCode} {response.ReasonPhrase}");
        //    //}


        //    //var client = _clientFact.CreateClient();
        //    //client.DefaultRequestHeaders.Accept.Clear();
        //    //client.DefaultRequestHeaders.Accept.Add(
        //    //    new MediaTypeWithQualityHeaderValue("application/vnd.github.v3+json"));
        //    //client.DefaultRequestHeaders.Add("User-Agent", ".NET Foundation Repository Reporter");

        //    //var stringTask = client.GetStringAsync("https://api.github.com/orgs/dotnet/repos");

        //    //var msg = await stringTask;
        //    //Console.Write(msg);
        //}

        //async Task<ApiClientResponse<TResponse>> RestSharpPost<T, TResponse>(T content, string uri, bool IsStringResponse, bool IsSingleObject = false)
        //{
        //    var client = new RestClient("https://test.senasa.gov.ar/");
        //    // client.Authenticator = new HttpBasicAuthenticator(username, password);
        //    var request = new RestRequest(uri);
        //    request.RequestFormat = DataFormat.Json;
        //    request.Timeout = 300000;
        //    var json = JsonConvert.SerializeObject(content);
        //    request.AddJsonBody(json);
        //    var response = client.Post(request);
        //    var rescontent = response.Content; // Raw content as string
        //    var response2 = client.Post<ApiClientResponseFlat>(request);
        //    var resultObject = new ApiClientResponse<TResponse>();
        //    resultObject.code = response2.Data.code;
        //    resultObject.error = response2.Data.Data;
        //    resultObject.ok = response2.Data.ok;
        //    resultObject.okMessage = response2.Data.Data;
        //    resultObject.warning = response2.Data.warning;
        //    return resultObject;


        //}

        //async Task<ApiClientResponse<TResponse>> HttpWebRequestPost<T, TResponse>(T content, string uri, bool IsStringResponse, bool IsSingleObject = false)
        //{
        //    var request = (HttpWebRequest)WebRequest.Create("https://test.senasa.gov.ar/"+uri);

        //    var json = JsonConvert.SerializeObject(content);

        //    var data = Encoding.ASCII.GetBytes(json);

        //    request.Method = "POST";
        //    request.ContentType = "application/json";
        //    request.ContentLength = data.Length;

        //    using (var stream = request.GetRequestStream())
        //    {
        //        stream.Write(data, 0, data.Length);
        //    }

        //    var response = (HttpWebResponse)request.GetResponse();

        //    var responseString = new StreamReader(response.GetResponseStream()).ReadToEnd();
        //    var result = JsonConvert.DeserializeObject<ApiClientResponseFlat>(responseString);
        //    var resultObject = new ApiClientResponse<TResponse>();
        //    resultObject.code = result.code;
        //    resultObject.error = result.Data;
        //    resultObject.ok = result.ok;
        //    resultObject.okMessage = result.Data;
        //    resultObject.warning = result.warning;
        //    return resultObject;            
        //}

        //public async Task<ApiClientResponse<TResponse>> WebClientPost<T, TResponse>(T content, string uri, bool IsStringResponse, bool IsSingleObject = false)
        //{
        //    try
        //    {
        //        using (WebClient webClient = new WebClient())
        //        {
        //            webClient.BaseAddress = "https://test.senasa.gov.ar/";
        //            var url = $"sigsa/seam/resource/rest/nueva-acta-campania/guardar";
        //            // webClient.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");
        //            webClient.Headers.Add("user-agent", "PostmanRuntime/7.28.4"); 
        //            webClient.Headers[HttpRequestHeader.ContentType] = "application/json";
        //            string data = JsonConvert.SerializeObject(content);
        //            var response = webClient.UploadString(url, data);
        //            var result = JsonConvert.DeserializeObject<ApiClientResponseFlat>(response);
        //            var resultObject = new ApiClientResponse<TResponse>();
        //            resultObject.code = result.code;
        //            resultObject.error = result.Data;
        //            resultObject.ok = result.ok;
        //            resultObject.okMessage = result.Data;
        //            resultObject.warning = result.warning;
        //            return resultObject;                    
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
        //public async Task<ApiClientResponse<TResponse>> HttpClientPost<T, TResponse>(T content, string uri, bool IsStringResponse, bool IsSingleObject = false)
        //{
        //    //Consultar info sobre las campañas de los planes asigandos
        //    using (var cliente = new HttpClient())
        //    {

        //        cliente.Timeout = TimeSpan.FromSeconds(300);
        //        var json = JsonConvert.SerializeObject(content);
        //        var data = new StringContent(json, Encoding.UTF8, "application/json");


        //        var response = await cliente.PostAsync("https://test.senasa.gov.ar/"+uri, data);
        //        // var format = "dd/MM/yyyy HH:mm"; // your datetime format
        //        // var format = "dd/MM/yyyy HH:mm"; // your datetime format
        //        // var dateTimeConverter = new IsoDateTimeConverter { Culture = CultureInfo.InvariantCulture, DateTimeFormat = format ,DateTimeStyles=DateTimeStyles.None};

        //        if (response.IsSuccessStatusCode)
        //        {
        //            var responseAux = await response.Content.ReadAsStringAsync();

        //            //var responseStream = await response.Content.ReadAsStreamAsync();
        //            //using (Stream streamToReadFrom = await response.Content.ReadAsStreamAsync())
        //            //{
        //            //    string fileToWriteTo = Path.GetTempFileName();
        //            //    fileToWriteTo = fileToWriteTo.Replace("tmp", "txt");
        //            //    using (Stream streamToWriteTo = File.Open(fileToWriteTo, FileMode.Create))
        //            //    {
        //            //        await streamToReadFrom.CopyToAsync(streamToWriteTo);
        //            //        await streamToReadFrom.CopyToAsync(Console.OpenStandardOutput());

        //            //    }
        //            //    var sw = new StreamWriter(Console.OpenStandardOutput());

        //            //    sw.AutoFlush = true;
        //            //    Console.SetOut(sw);
        //            //}


        //            if (response.StatusCode == System.Net.HttpStatusCode.OK)
        //            {
        //                var ok = JsonConvert.DeserializeObject<ApiClientResponseOKCheck>(responseAux);
        //                if (ok.ok)
        //                {
        //                    if (!IsStringResponse)
        //                    {
        //                        var result = JsonConvert.DeserializeObject<ApiClientResponse<TResponse>>(responseAux);
        //                        return result;
        //                    }
        //                    else if (IsSingleObject)
        //                    {
        //                        var result = JsonConvert.DeserializeObject<ApiClientResponseSingle<TResponse>>(responseAux);
        //                        var resultObject = new ApiClientResponse<TResponse>();
        //                        resultObject.code = result.code;
        //                        resultObject.Data = new List<TResponse>();
        //                        resultObject.Data.Add(result.Data);
        //                        resultObject.ok = result.ok;
        //                        resultObject.warning = result.warning;
        //                        return resultObject;
        //                    }
        //                    else
        //                    {
        //                        var result = JsonConvert.DeserializeObject<ApiClientResponseFlat>(responseAux);
        //                        var resultObject = new ApiClientResponse<TResponse>();
        //                        resultObject.code = result.code;
        //                        resultObject.error = result.Data;
        //                        resultObject.ok = result.ok;
        //                        resultObject.okMessage = result.Data;
        //                        resultObject.warning = result.warning;
        //                        return resultObject;
        //                    }


        //                }
        //                else //if  (response.StatusCode == System.Net.HttpStatusCode.InternalServerError)
        //                {
        //                    var error = JsonConvert.DeserializeObject<ApiClientResponseFlat>(responseAux);
        //                    var resultError = new ApiClientResponse<TResponse>();
        //                    resultError.code = error.code;
        //                    resultError.error = error.Data;
        //                    resultError.ok = error.ok;
        //                    resultError.warning = error.warning;
        //                    return resultError;
        //                }
        //            }

        //        }
        //        //var result = JsonConvert.DeserializeObject<TResponse>(responseAux, dateTimeConverter);            
        //        return null;
        //    }

        //}

        public async Task<TResponse> Get<TResponse>(string uri)
        {
            var cliente = _clientFact.CreateClient("Api.ML");
            var response = await cliente.GetAsync(uri);

            if (response.IsSuccessStatusCode)
            {
                var content = await response.Content.ReadAsStringAsync();
                var result = JsonConvert.DeserializeObject<TResponse>(content);
                return result;
            }
            else if (response.StatusCode == HttpStatusCode.NotFound)
            {
                throw new BusinessException("No se encuentra el recurso solicitado en Api Mercado Libre");
            }
            else
                throw new BusinessException("Error en solicitud Api Mercado Libre");            
        }

        public async Task<ItemResponse> Items(string Producto)
        {
            return await Get<ItemResponse>(string.Format("items/{0}",Producto));
        }


        public async Task<ApiClientResponse<TResponse>> Post<T, TResponse>(T content, string uri,bool IsStringResponse,bool IsSingleObject = false)
        {
            //Consultar info sobre las campañas de los planes asigandos
            var cliente = _clientFact.CreateClient("Senasa");
            var json = JsonConvert.SerializeObject(content);
            var data = new StringContent(json, Encoding.UTF8, "application/json");
                       

            var response = await cliente.PostAsync(uri, data);
            // var format = "dd/MM/yyyy HH:mm"; // your datetime format
            // var format = "dd/MM/yyyy HH:mm"; // your datetime format
            // var dateTimeConverter = new IsoDateTimeConverter { Culture = CultureInfo.InvariantCulture, DateTimeFormat = format ,DateTimeStyles=DateTimeStyles.None};

            if (response.IsSuccessStatusCode)
            {
                var responseAux = await response.Content.ReadAsStringAsync();
               
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    var ok = JsonConvert.DeserializeObject<ApiClientResponseOKCheck>(responseAux);
                    if (ok.ok)
                    {
                        if (!IsStringResponse)
                        {
                            var result = JsonConvert.DeserializeObject<ApiClientResponse<TResponse>>(responseAux);
                            return result;
                        }
                        else if (IsSingleObject)
                        {
                            var result = JsonConvert.DeserializeObject<ApiClientResponseSingle<TResponse>>(responseAux);
                            var resultObject = new ApiClientResponse<TResponse>();
                            resultObject.code = result.code;
                            resultObject.Data = new List<TResponse>();
                            resultObject.Data.Add(result.Data);
                            resultObject.ok = result.ok;
                            resultObject.warning = result.warning;
                            return resultObject;
                        }
                        else
                        {
                            var result = JsonConvert.DeserializeObject<ApiClientResponseFlat>(responseAux);
                            var resultObject = new ApiClientResponse<TResponse>();
                            resultObject.code = result.code;
                            resultObject.error = result.Data;
                            resultObject.ok = result.ok;
                            resultObject.okMessage = result.Data;
                            resultObject.warning = result.warning;
                            return resultObject;
                        }
                            

                    }
                    else //if  (response.StatusCode == System.Net.HttpStatusCode.InternalServerError)
                    {
                        var error = JsonConvert.DeserializeObject<ApiClientResponseFlat>(responseAux);
                        var resultError = new ApiClientResponse<TResponse>();
                        resultError.code = error.code;
                        resultError.error = error.Data;
                        resultError.ok = error.ok;
                        resultError.warning = error.warning;
                        return resultError;
                    }
                }

            }
            //var result = JsonConvert.DeserializeObject<TResponse>(responseAux, dateTimeConverter);            
            return null;
        }


        //public async Task<ApiClientResponse<ApiCampañasDto>> Campañas(TokenSenasaContent tokenContent)
        //{
        //    //TokenSenasaContent tokenContent = new TokenSenasaContent("33-64402022-9", "33-64402022-9", "61137e75-f1f5-4cbe-9848-888217dee22f");
        //    return await Post<TokenSenasaContent, ApiClientResponse<ApiCampañasDto>>(tokenContent, $"/sigsa/seam/resource/rest/actas-fundacion/campanias");
        //}

        //public async Task<List<ApiActasDto>> Actas(ActasContent ActasContent)
        //{
        //    //InfoActasContent InfoActasConten = new InfoActasContent("33-64402022-9", "33-64402022-9", "61137e75-f1f5-4cbe-9848-888217dee22f", "15.244-2021/01");
        //    var res = await Post<ActasContent, ApiActasDto>(ActasContent, "sigsa/seam/resource/rest/actas-fundacion/actas",false);
        //    if (res.ok)
        //        return res.Data;
        //    else
        //        throw new BusinessException(res.error);
        //}

        //public async Task<List<ApiActasPendientesDto>> Acta(ActaContent ActaContent)
        //{
        //    var res = await Post<ActaContent, ApiActasPendientesDto>(ActaContent, "sigsa/seam/resource/rest/actas-fundacion/acta",true,true);
        //    if (res.ok)
        //        return res.Data;
        //    else
        //        throw new BusinessException(res.error);
        //}

        //public async Task<List<ApiActasPendientesDto>> ActasPendientes(ActasPendientesContent ActasPendientesContent)
        //{
        //    //ConsultarActasPendientesContent InfoActasConten = new ConsultarActasPendientesContent("33-64402022-9", "33-64402022-9", "61137e75-f1f5-4cbe-9848-888217dee22f", "15.244-2021/01");
        //   var res = await Post<ActasPendientesContent, ApiActasPendientesDto>(ActasPendientesContent, "sigsa/seam/resource/rest/actas-fundacion/actas-pendientes",false);
        //    if (res.ok)
        //       return res.Data;
        //    else
        //        throw new BusinessException(res.error);
        //}

        ////public async Task<ApiClientResponse<ApiActasPendientesDto>> RenspasPlan(ActasPendientesContent ActasPendientesContent)
        ////{
        ////    return await Post<ActasPendientesContent, ApiClientResponse<ApiActasPendientesDto>>(ActasPendientesContent, $"/sigsa/seam/resource/rest/actas-fundacion/renspas-del-plan");
        ////}

        //public async Task<string> ConfirmarActa(ConfirmarActaContent ConfirmarActaContent)
        //{
        //    var res =  await Post<ConfirmarActaContent, string>(ConfirmarActaContent, "sigsa/seam/resource/rest/nueva-acta-campania/confirmar",true);
        //    if (res.ok)
        //        return res.okMessage;
        //    else
        //        throw new BusinessException(res.error);
        //}

        //public async Task<string> AnularActa(AnularActaContent AnularActaContent)
        //{
        //    var res =  await Post<AnularActaContent, string>(AnularActaContent, "sigsa/seam/resource/rest/acta-campania/anular", true);
        //    if (res.ok)
        //        return res.okMessage;
        //    else
        //        throw new BusinessException(res.error);
        //}

       

        //public async Task<string> GuardarActa(GuardarActaContent GuardarActaContent)
        //{
        //    var res = await Post<GuardarActaContent, string>(GuardarActaContent, "sigsa/seam/resource/rest/nueva-acta-campania/guardar",true);
        //    if (res.ok)
        //        return res.okMessage;
        //    else
        //        throw new BusinessException(res.error);
        //}



        //public async Task<List<ApiVacunasDto>> Vacunas(TokenSenasaContent tokenContent)
        //{
        //    var res =  await Post<TokenSenasaContent, ApiVacunasDto>(tokenContent, "sigsa/seam/resource/rest/nueva-acta-campania/vacunas",false);             
        //    if (res.ok)
        //        return res.Data;
        //    else
        //        throw new BusinessException(res.error);
        //}

        //public async Task<List<ApiAnimalesDto>> CategoriasAnimales(TokenSenasaContent tokenContent)
        //{
        //    var res = await Post<TokenSenasaContent, ApiAnimalesDto>(tokenContent, "sigsa/seam/resource/rest/nueva-acta-campania/categorias",false);
        //    if (res.ok)
        //        return res.Data;
        //    else
        //        throw new BusinessException(res.error);
        //}

        ////public async Task<ApiClientResponse<ApiTiposIdentificacionDto>> TiposIdentificacion(TokenSenasaContent tokenContent)
        ////{
        ////    return await Post<TokenSenasaContent, ApiClientResponse<ApiTiposIdentificacionDto>>(tokenContent, $"/sigsa/seam/resource/rest/nueva-acta-campania/tipos-identificacion");
        ////}

    }
}
