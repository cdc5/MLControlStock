using MLControlStock.Core.ApiClient.JsonConverters;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace MLControlStock.Core.ApiClient.Dtos
{
    public class ApiClientResponse<T>
    {
        public List<T> Data { get; set; }
        public bool ok { get; set; }
        public string okMessage { get; set; }
        public int code { get; set; }
        public string warning { get; set; }        
        public string error { get; set; }
    }
}
