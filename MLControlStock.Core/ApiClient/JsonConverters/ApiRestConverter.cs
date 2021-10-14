using FundaGes.Core.ApiClient.Dtos;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.ApiClient.JsonConverters
{
    public class ApiRestConverter<T>: JsonConverter
    {
        public override bool CanConvert(Type objectType)
        {
            return (objectType == typeof(ApiClientResponse<T>));
        }

        public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
        {
            JToken token = JToken.Load(reader);
            if (token.Type == JTokenType.Object)
            {
                return token.ToObject<ApiClientResponse<T>>();
            }
            return null;
        }

        public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
        {
            throw new NotImplementedException();
        }
    
    }
}
