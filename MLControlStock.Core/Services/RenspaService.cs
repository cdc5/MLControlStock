using AutoMapper;
using FundaGes.Core.DTOs;
using FundaGes.Core.Entities;
using FundaGes.Core.Interfaces;
using FundaGes.Core.QueryFilters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FundaGes.Core.Services
{
    public class RenspaService : IRenspaService
    {
        private IUnitOfWork _UnitOfWork;
        private IApiClient _ApiClient;
        private readonly IMapper _Mapper;
        

        public RenspaService(IUnitOfWork unitOfWork, IApiClient apiClient, IMapper mapper)
        {
            _UnitOfWork = unitOfWork;
            _ApiClient = apiClient;
            _Mapper = mapper;            
        }

        public async Task InsertRenspa(RenspaDto renspaDto)
        {
            var renspa = _Mapper.Map<Renspas>(renspaDto);
            await _UnitOfWork.RenspaRepository.Insert(renspa);
            await _UnitOfWork.SaveChangesAsync();
        }

        public async Task<bool> DeleteRenspa(string id)
        {
            await _UnitOfWork.RenspaRepository.Delete(id);
            await _UnitOfWork.SaveChangesAsync();
            return true;
        }

        public async Task<Renspas> GetRenspa(string id)
        {
            return await _UnitOfWork.RenspaRepository.GetByID(id);            
        }

        public async Task<RenspaDto> GetRenspaDto(string id)
        {
            var renspa = await GetRenspa(id);
            var renspaDto = _Mapper.Map<RenspaDto>(renspa);
            return renspaDto;
        }

        public IEnumerable<Renspas> GetRenspas()
        {
            return _UnitOfWork.RenspaRepository.Get();            
        }

        public IEnumerable<RenspaDto> GetRenspasDto()
        {
            var Renspas = GetRenspas();
            var renspaDto = _Mapper.Map<IEnumerable<RenspaDto>>(Renspas);
            return renspaDto;
        }

        public IEnumerable<string> GetRenspasPorEstablecimiento(string establecimiento)
        {
            var renspas = _UnitOfWork.RenspaRepository.Get(x=>x.EstablecimientoId == establecimiento);
            return renspas.Select(s => s.Renspa);
        }


        public bool UpdateRenspa(string Renspa, RenspaDto RenspaDto)
        {
            var renspa = _Mapper.Map<Renspas>(RenspaDto);            
            renspa.Renspa = Renspa;
            _UnitOfWork.RenspaRepository.Update(renspa);
            _UnitOfWork.SaveChangesAsync();
            return true;
        }

    }
}
