using AutoMapper;
using FundaGes.Core.ApiClient.Content;
using FundaGes.Core.ApiClient.Dtos;
using FundaGes.Core.DTOs;
using FundaGes.Core.Entities;
using FundaGes.Core.Exceptions;
using FundaGes.Core.Interfaces;
using FundaGes.Core.QueryFilters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Security.Claims;
using System.Threading.Tasks;

namespace FundaGes.Core.Services
{
    public class AnimalesService : IAnimalesService
    {
        private IUnitOfWork _UnitOfWork;
        private IApiClient _ApiClient;
        private readonly IMapper _Mapper;
        private IUsuarioService _UsuarioService;

        public AnimalesService(IUnitOfWork unitOfWork, IMapper mapper, IApiClient ApiClient,
                           IUsuarioService UsuarioService)
        {
            _UnitOfWork = unitOfWork;
            _ApiClient = ApiClient;
            _Mapper = mapper;
            _UsuarioService = UsuarioService;
        }

        public async Task<IEnumerable<Animales>> GetAnimales(Expression<Func<Animales, bool>> filter = null,
                          Func<IQueryable<Animales>, IOrderedQueryable<Animales>> orderBy = null)
        {
            var Ani = _UnitOfWork.AnimalesRepository.Get(filter, orderBy, "Especie");
            return Ani;
        }

        public async Task<IEnumerable<AnimalesDto>> GetAnimalesDto()
        {
            var Ani = _UnitOfWork.AnimalesRepository.Get(null,null, "Especie");
            var AniDto = _Mapper.Map<IEnumerable<AnimalesDto>>(Ani);
            return AniDto;
        }

        public async Task<Animales> GetAnimal(string codigo)
        {
            var Ani = await GetAnimales(x => x.Codigo == codigo);
            return Ani.SingleOrDefault();
        }

        public async Task<AnimalesDto> GetAnimalDto(string codigo)
        {
            var Ani = await GetAnimales(x => x.Codigo == codigo);
            var AniDto = _Mapper.Map<AnimalesDto>(Ani);
            return AniDto;
        }

        public async Task<Animales> GetAnimal(int id)
        {
            var Ani = await GetAnimales(x => x.id == id);
            return Ani.SingleOrDefault();
        }

        public async Task<AnimalesDto> GetAnimalDto(int id)
        {
            var Ani = await GetAnimales(x => x.id == id);
            var AniDto = _Mapper.Map<AnimalesDto>(Ani);
            return AniDto;
        }


        public async Task<bool> CargarCategoriaAnimalesEnBase(ClaimsPrincipal User)
        {
            List<ApiAnimalesDto> ApiAnimalesDto;
            List<Animales> Animales;
            var usuario = _UsuarioService.GetUsuario(User);
            var TokenSenasaContent = new TokenSenasaContent(usuario.Fundacion.Cuit, usuario.Fundacion.wsUsername, usuario.Fundacion.TokenSenasa);
            ApiAnimalesDto = await _ApiClient.CategoriasAnimales(TokenSenasaContent);
            Animales = _Mapper.Map<List<Animales>>(ApiAnimalesDto);
            var especies = Animales.GroupBy(x => x.EspecieId, (key, group) => group.First()).Select(x => x.Especie);
            await _UnitOfWork.EspeciesRepository.AddRange(especies);
            foreach (var an in Animales)
            {
                an.Especie = null;
            }
            await _UnitOfWork.AnimalesRepository.AddRange(Animales);
            await _UnitOfWork.SaveChangesAsync();            
            return true;
        }

        public async Task<bool> CargarCategoriaAnimalesFaltantesEnBase(ClaimsPrincipal User)
        {
            List<ApiAnimalesDto> ApiAnimalesDto;
            List<Animales> Animales;
            var usuario = _UsuarioService.GetUsuario(User);
            var TokenSenasaContent = new TokenSenasaContent(usuario.Fundacion.Cuit, usuario.Fundacion.wsUsername, usuario.Fundacion.TokenSenasa);
            ApiAnimalesDto = await _ApiClient.CategoriasAnimales(TokenSenasaContent);
            Animales = _Mapper.Map<List<Animales>>(ApiAnimalesDto);
            var Especies = Animales.GroupBy(x => x.EspecieId, (key, group) => group.First()).Select(x => x.Especie);

            var AnimalesBase =await GetAnimales();
            var EspeciesBase = AnimalesBase.GroupBy(x => x.EspecieId, (key, group) => group.First()).Select(x => x.Especie);

            Animales = Animales.Where(item => !AnimalesBase.Any(x => x.id == item.id)).ToList();
            Especies = Especies.Where(item => !EspeciesBase.Any(x => x.Id == item.Id)).ToList();            

            await _UnitOfWork.EspeciesRepository.AddRange(Especies);
            foreach (var an in Animales)
            {
                an.Especie = null;
            }
            await _UnitOfWork.AnimalesRepository.AddRange(Animales);
            await _UnitOfWork.SaveChangesAsync();
            return true;
        }

    }
}
