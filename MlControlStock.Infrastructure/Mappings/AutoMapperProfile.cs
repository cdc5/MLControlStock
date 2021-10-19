using AutoMapper;
using MLControlStock.Core.DTOs;
using MLControlStock.Core.Entities;

namespace MLControlStock.Infrastructure.Mappings
{
    public class AutoMapperProfile:Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<Stock, StockDto>();
        }
    }
}
