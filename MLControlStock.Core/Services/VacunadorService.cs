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
    public class VacunadorService :IVacunadorService
    {
        private IUnitOfWork _UnitOfWork;
        private IApiClient _ApiClient;
        private readonly IMapper _Mapper;
        private IUsuarioService _UsuarioService;
        private IFundacionService _FundacionService;


        public VacunadorService(IUnitOfWork unitOfWork, IApiClient ApiClient, IMapper mapper
                                ,IUsuarioService usuarioService, IFundacionService fundacionService)
        {
            _UnitOfWork = unitOfWork;
            _ApiClient = ApiClient;
            _Mapper = mapper;
            _UsuarioService = usuarioService;
            _FundacionService = fundacionService;
        }

        public async Task<VacunadorDtoOut> GetVacunador(int id)
        {
            var vacunador = await _UnitOfWork.VacunadorRepository.GetByID(id);
            var usuarioDtoOut = _Mapper.Map<VacunadorDtoOut>(vacunador);
            return usuarioDtoOut;
        }

        public Vacunadores GetVacunadorPorCuit(string Cuit)
        {
            var Vac = _UnitOfWork.VacunadorRepository.GetVacunadorPorCuit(Cuit);
            return Vac;
            //else
            //    throw new BusinessException("El Cuit proporcionado no corresponde a un Vacunador registrado");
        }

        //public IEnumerable<VacunadorDtoOut> GetVacunadores()
        public IEnumerable<VacunadorDtoOut> GetVacunadores(VacunadorQueryFilter filters)       
        {
            var vacunadores = _UnitOfWork.VacunadorRepository.Get();            
            if (filters.CuitFundacion != null)
            {
                var Fund = _FundacionService.GetFundacionPorCuit(filters.CuitFundacion);
                vacunadores = vacunadores.Where(x => x.FundacionId == Fund.Id);                             
            }
            var vacunadoresDtoOut = _Mapper.Map<IEnumerable<VacunadorDtoOut>>(vacunadores);
            return vacunadoresDtoOut;
        }

        public async Task InsertVacunador(VacunadorDto VacunadorDto)
        {
            var vacunador = _Mapper.Map<Vacunadores>(VacunadorDto);
            vacunador.FechaCreacion = DateTime.Now;
            await _UnitOfWork.VacunadorRepository.Insert(vacunador);
            await _UnitOfWork.SaveChangesAsync();
        }

        public async Task<bool> UpdateVacunador(int id, VacunadorUpdateDto VacunadorDto)
        {
            Vacunadores vacunador = await _UnitOfWork.VacunadorRepository.GetByID(id);
            if (vacunador != null)
            {
                vacunador.Id = id;
                vacunador.TokenSenasa = VacunadorDto.TokenSenasa;
                _UnitOfWork.VacunadorRepository.Update(vacunador);
                await _UnitOfWork.SaveChangesAsync();
                return true;
            }
            else
                throw new BusinessException("No existe el Vacunador ID: " + id);
        }
        public void UpdateVacunador(Vacunadores vacunador)
        {
            _UnitOfWork.VacunadorRepository.Update(vacunador);
        }

        public async Task<bool> DeleteVacunador(int id)
        {
            await _UnitOfWork.VacunadorRepository.Delete(id);
            await _UnitOfWork.SaveChangesAsync();
            return true;
        }
    }
}
