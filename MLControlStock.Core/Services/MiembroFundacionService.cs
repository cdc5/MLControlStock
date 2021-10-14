using AutoMapper;
using FundaGes.Core.DTOs;
using FundaGes.Core.Entities;
using FundaGes.Core.Exceptions;
using FundaGes.Core.Interfaces;
using FundaGes.Core.QueryFilters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FundaGes.Core.Services
{
    public class MiembroFundacionService : IMiembroFundacionService
    {
        private IUnitOfWork _UnitOfWork;
        private IApiClient _ApiClient;
        private readonly IMapper _Mapper;
        private IUsuarioService _UsuarioService;
        private IFundacionService _fundacionService;


        public MiembroFundacionService(IUnitOfWork unitOfWork, IApiClient ApiClient, IMapper mapper
                                , IUsuarioService usuarioService, IFundacionService fundacionService)
        {
            _UnitOfWork = unitOfWork;
            _ApiClient = ApiClient;
            _Mapper = mapper;
            _UsuarioService = usuarioService;
            _fundacionService = fundacionService;
        }

        public async Task<MiembroFundacionDtoOut> GetMiembroFundacion(int id)
        {
            var MiembroFundacion = await _UnitOfWork.MiembroFundacionRepository.GetByID(id);
            var usuarioDtoOut = _Mapper.Map<MiembroFundacionDtoOut>(MiembroFundacion);
            return usuarioDtoOut;
        }
                       
        public IEnumerable<MiembroFundacionDtoOut> GetMiembrosFundacion(MiembroFundacionQueryFilter filters)
        {
            var MiembroFundaciones = _UnitOfWork.MiembroFundacionRepository.Get();
            if (filters.CuitFundacion != null)
            {
                var Fund = _fundacionService.GetFundacionPorCuit(filters.CuitFundacion);
                MiembroFundaciones = MiembroFundaciones.Where(x => x.FundacionId == Fund.Id);
            }
            var MiembroFundacionesDtoOut = _Mapper.Map<IEnumerable<MiembroFundacionDtoOut>>(MiembroFundaciones);
            return MiembroFundacionesDtoOut;
        }

        public async Task InsertMiembroFundacion(MiembroFundacionDto MiembroFundacionDto)
        {
            var MiembroFundacion = _Mapper.Map<MiembrosFundacion>(MiembroFundacionDto);
            MiembroFundacion.FechaCreacion = DateTime.Now;
            await _UnitOfWork.MiembroFundacionRepository.Insert(MiembroFundacion);
            await _UnitOfWork.SaveChangesAsync();
        }

        public async Task<bool> UpdateMiembroFundacion(int id, MiembroFundacionUpdateDto MiembroFundacionDto)
        {
            MiembrosFundacion MiembroFundacion = await _UnitOfWork.MiembroFundacionRepository.GetByID(id);
            if (MiembroFundacion != null)
            {
                MiembroFundacion.Id = id;
                MiembroFundacion.TokenSenasa = MiembroFundacionDto.TokenSenasa;
                _UnitOfWork.MiembroFundacionRepository.Update(MiembroFundacion);
                await _UnitOfWork.SaveChangesAsync();
                return true;
            }
            else
                throw new BusinessException("No existe el Miembro de Fundacion ID: " + id);
        }
        public void UpdateMiembroFundacion(MiembrosFundacion MiembroFundacion)
        {
            _UnitOfWork.MiembroFundacionRepository.Update(MiembroFundacion);
        }

        public async Task<bool> DeleteMiembroFundacion(int id)
        {
            await _UnitOfWork.MiembroFundacionRepository.Delete(id);
            await _UnitOfWork.SaveChangesAsync();
            return true;
        }
    }
}
