using AutoMapper;
using FundaGes.Core.DTOs;
using FundaGes.Core.Entities;
using FundaGes.Core.Exceptions;
using FundaGes.Core.Interfaces;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace FundaGes.Core.Services
{
    public class FundacionService:IFundacionService
    {
        private IUnitOfWork _UnitOfWork;
        private IApiClient _ApiClient;
        private readonly IMapper _Mapper;

        public FundacionService(IUnitOfWork unitOfWork, IApiClient ApiClient, IMapper mapper)
        {
            _UnitOfWork = unitOfWork;
            _ApiClient = ApiClient;
            _Mapper = mapper;
        }

        public FundacionDtoOut GetFundacionDto(int id)
        {
            var fund = GetFundacion(id);
            var fundDtoOut = _Mapper.Map<FundacionDtoOut>(fund);
            return fundDtoOut;
        }

        public Fundaciones GetFundacion(int id)
        {
            var fund = _UnitOfWork.FundacionRepository.GetFirst(x => x.Id == id, "Subcentros");
            if (fund != null)
                return fund;
            else
                throw new BusinessException("El ID proporcionado no corresponde a una Fundacion registrada");            
        }

        //No exponer este metodo
        public Fundaciones GetFundacionPorCuit(string Cuit)
        {
            var Fundacion = _UnitOfWork.FundacionRepository.GetFundacionPorCuit(Cuit);
            if (Fundacion != null)
                return Fundacion;
            else
                throw new BusinessException("El Cuit proporcionado no corresponde a una Fundacion registrada");
        }

        public IEnumerable<FundacionDtoOut> GetFundaciones()
        {
            var funds = _UnitOfWork.FundacionRepository.Get();
            var fundsDtoOut = _Mapper.Map<IEnumerable<FundacionDtoOut>>(funds);
            return fundsDtoOut;
        }

        public async Task InsertFundacion(FundacionDto FundacionDto)
        {
            var fund = _Mapper.Map<Fundaciones>(FundacionDto);
            fund.FechaCreacion = DateTime.Now;
            await InsertFundacion(fund);
        }

        public async Task InsertFundacion(Fundaciones fund)
        {
            await _UnitOfWork.FundacionRepository.Insert(fund);
            await _UnitOfWork.SaveChangesAsync();
        }

        public async Task<bool> UpdateFundacion(int id, FundacionUpdateDto FundacionUpdateDto)
        {
            Fundaciones fund = await _UnitOfWork.FundacionRepository.GetByID(id);
            if (fund != null)
            {
                fund.Id = id;
                fund.TokenSenasa = FundacionUpdateDto.TokenSenasa;
                _UnitOfWork.FundacionRepository.Update(fund);
                await _UnitOfWork.SaveChangesAsync();
                return true;
            }
            else
                throw new BusinessException("No existe La fundación ID: " + id);
        }

        public void UpdateFundacion(Fundaciones fundacion)
        {
             _UnitOfWork.FundacionRepository.Update(fundacion);
        }

        public async Task<bool> DeleteFundacion(int id)
        {
            await _UnitOfWork.FundacionRepository.Delete(id);
            await _UnitOfWork.SaveChangesAsync();
            return true;
        }
    }
}
