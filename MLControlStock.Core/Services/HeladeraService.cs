using AutoMapper;
using FundaGes.Core.DTOs;
using FundaGes.Core.Entities;
using FundaGes.Core.Exceptions;
using FundaGes.Core.Interfaces;
using FundaGes.Core.QueryFilters;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace FundaGes.Core.Services
{
    public class HeladeraService:IHeladeraService
    {
        private IUnitOfWork _UnitOfWork;
        private IApiClient _ApiClient;
        private readonly IMapper _Mapper;
        private IFundacionService _FundacionService;

        public HeladeraService(IUnitOfWork unitOfWork, IApiClient apiClient, IMapper mapper
                               , IFundacionService fundacionService)
        {
            _UnitOfWork = unitOfWork;
            _ApiClient = apiClient;
            _Mapper = mapper;
            _FundacionService = fundacionService;
        }

        public async Task InsertHeladera(HeladeraDto HeladeraDto)
        {
            var Fund =_FundacionService.GetFundacion(HeladeraDto.FundacionId);
            if (!Fund.Subcentros.Any(x => x.Id == HeladeraDto.SubcentroId))
                throw new BusinessException(string.Format("La fundacion {0}, no posee Subcentro {1}", Fund.Nombre, HeladeraDto.SubcentroId));
            

            var Heladera = _Mapper.Map<Heladeras>(HeladeraDto);
            await _UnitOfWork.HeladeraRepository.Insert(Heladera);
            await _UnitOfWork.SaveChangesAsync();
        }

        public async Task<bool> DeleteHeladera(int id)
        {
            await _UnitOfWork.HeladeraRepository.Delete(id);
            await _UnitOfWork.SaveChangesAsync();
            return true;
        }

        public HeladeraDtoOut GetHeladeraDto(int id)
        {
            var Heladera = GetHeladera(id);
            var HeladeraDto = _Mapper.Map<HeladeraDtoOut>(Heladera);
            return HeladeraDto;
        }

        public Heladeras GetHeladera(int id)
        {
            var Heladera = _UnitOfWork.HeladeraRepository.GetFirst(x => x.Id == id, "Subcentro");
            return Heladera;
        }

        public IEnumerable<HeladeraDtoOut> GetHeladeras(HeladeraQueryFilter filters)
        {
            var Hels = _UnitOfWork.HeladeraRepository.Get(null, null, "Subcentro");
            if (filters.idFundacion != null)
            {
                var Fund = _FundacionService.GetFundacion(filters.idFundacion.Value);
                Hels = Hels.Where(x => x.FundacionId == Fund.Id).ToList();
            }

            if (filters.idSubCentro != null)
            {
                Hels = Hels.Where(x => x.SubcentroId == filters.idSubCentro.Value).ToList();
            }
            var HelsDto = _Mapper.Map<IEnumerable<HeladeraDtoOut>>(Hels);
            return HelsDto;
        }

        public bool UpdateHeladera(int id, HeladeraDto HeladeraDto)
        {
            var Est = _Mapper.Map<Heladeras>(HeladeraDto);
            Est.Id = id;
            _UnitOfWork.HeladeraRepository.Update(Est);
            _UnitOfWork.SaveChangesAsync();
            return true;
        }

    }
}
