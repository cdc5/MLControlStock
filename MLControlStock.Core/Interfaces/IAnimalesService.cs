using FundaGes.Core.DTOs;
using FundaGes.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Security.Claims;
using System.Threading.Tasks;

namespace FundaGes.Core.Interfaces
{
    public interface IAnimalesService
    {
        Task<bool> CargarCategoriaAnimalesEnBase(ClaimsPrincipal User);
        Task<bool> CargarCategoriaAnimalesFaltantesEnBase(ClaimsPrincipal User);
        Task<IEnumerable<Animales>> GetAnimales(Expression<Func<Animales, bool>> filter = null,
                          Func<IQueryable<Animales>, IOrderedQueryable<Animales>> orderBy = null);
        Task<IEnumerable<AnimalesDto>> GetAnimalesDto();
        Task<Animales> GetAnimal(string codigo);
        Task<AnimalesDto> GetAnimalDto(string codigo);
        Task<Animales> GetAnimal(int id);
        Task<AnimalesDto> GetAnimalDto(int id);
    }
}