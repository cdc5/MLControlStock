using AutoMapper;
using FundaGes.Core.DTOs;
using FundaGes.Core.Entities;
using FundaGes.Core.Interfaces;
using FundaGes.Core.QueryFilters;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FundaGes.Core.Services
{
    public class SubCentroService:ISubCentroService
    {
        private IUnitOfWork _UnitOfWork;
        private IApiClient _ApiClient;
        private readonly IMapper _Mapper;
        private IFundacionService _FundacionService;

        public SubCentroService(IUnitOfWork unitOfWork, IApiClient apiClient, IMapper mapper
                                    , IFundacionService fundacionService)
        {
            _UnitOfWork = unitOfWork;
            _ApiClient = apiClient;
            _Mapper = mapper;
            _FundacionService = fundacionService;
        }

        public async Task InsertSubCentro(SubCentroDto SubCentroDto)
        {
            var SubCentro = _Mapper.Map<Subcentros>(SubCentroDto);
            await _UnitOfWork.SubCentroRepository.Insert(SubCentro);
            await _UnitOfWork.SaveChangesAsync();
        }

        public async Task<bool> DeleteSubCentro(int id)
        {
            await _UnitOfWork.SubCentroRepository.Delete(id);
            await _UnitOfWork.SaveChangesAsync();
            return true;
        }

        public SubCentroDtoOut GetSubCentro(int id)
        {
            var SubCentro = _UnitOfWork.SubCentroRepository.GetFirst(x => x.Id == id, "Heladeras");
            var SubCentroDto = _Mapper.Map<SubCentroDtoOut>(SubCentro);
            return SubCentroDto;
        }

        public IEnumerable<SubCentroDtoOut> GetSubCentros(SubCentroQueryFilter filters)
        {
            var Subs = _UnitOfWork.SubCentroRepository.Get(null, null, "Heladeras");
            if (filters.idFundacion != null)
            {
                var Fund = _FundacionService.GetFundacion(filters.idFundacion.Value);
                Subs = Subs.Where(x => x.FundacionId == Fund.Id);
            }
            var HelsDto = _Mapper.Map<IEnumerable<SubCentroDtoOut>>(Subs);
            return HelsDto;
        }

        public bool UpdateSubCentro(int id, SubCentroDto SubCentroDto)
        {
            var Est = _Mapper.Map<Subcentros>(SubCentroDto);
            Est.Id = id;
            _UnitOfWork.SubCentroRepository.Update(Est);
            _UnitOfWork.SaveChangesAsync();
            return true;
        }

    }
}
