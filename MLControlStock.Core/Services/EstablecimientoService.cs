using AutoMapper;
using MLControlStock.Core.DTOs;
using MLControlStock.Core.Entities;
using MLControlStock.Core.Interfaces;
using MLControlStock.Core.QueryFilters;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MLControlStock.Core.Services
{
    public class EstablecimientoService //: IEstablecimientoService
    {
        //private IUnitOfWork _UnitOfWork;
        //private IApiClient _ApiClient;
        //private readonly IMapper _Mapper;
        //private IFundacionService _FundacionService;

        //public EstablecimientoService(IUnitOfWork unitOfWork, IApiClient apiClient, IMapper mapper
        //                            ,IFundacionService fundacionService)
        //{
        //    _UnitOfWork = unitOfWork;
        //    _ApiClient = apiClient;
        //    _Mapper = mapper;
        //    _FundacionService = fundacionService;
        //}

        //public async Task InsertEstablecimiento(EstablecimientoDto EstablecimientoDto)
        //{
        //    var establecimiento = _Mapper.Map<Establecimiento>(EstablecimientoDto);
        //    await _UnitOfWork.EstablecimientoRepository.Insert(establecimiento);
        //    await _UnitOfWork.SaveChangesAsync();
        //}

        //public async Task<bool> DeleteEstablecimiento(string id)
        //{
        //    await _UnitOfWork.EstablecimientoRepository.Delete(id);
        //    await _UnitOfWork.SaveChangesAsync();
        //    return true;
        //}

        //public EstablecimientoDto GetEstablecimiento(string id)
        //{
        //    var Est = _UnitOfWork.EstablecimientoRepository.GetFirst(x=>x.Id==id,"Renspas");
        //    var EstDto = _Mapper.Map<EstablecimientoDto>(Est);
        //    return EstDto;
        //}

        //public IEnumerable<EstablecimientoDto> GetEstablecimientos(EstablecimientoQueryFilter filters)
        //{
        //    var Ests = _UnitOfWork.EstablecimientoRepository.Get(null,null, "Renspas");
        //    if (filters.CuitFundacion != null)
        //    {
        //        var Fund = _FundacionService.GetFundacionPorCuit(filters.CuitFundacion);
        //        Ests = Ests.Where(x => x.FundacionId == Fund.Id);                
        //    }
        //    var EstDto = _Mapper.Map<IEnumerable<EstablecimientoDto>>(Ests);
        //    return EstDto;
        //}

        //public bool UpdateEstablecimiento(string id,EstablecimientoDto EstablecimientoDto)
        //{
        //    var Est = _Mapper.Map<Establecimiento>(EstablecimientoDto);
        //    Est.Id = id;
        //    _UnitOfWork.EstablecimientoRepository.Update(Est);
        //    _UnitOfWork.SaveChangesAsync();
        //    return true;
        //}

    }
}
