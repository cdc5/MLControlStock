using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using FundaGes.Core.DTOs;
using FundaGes.Core.Entities;
using FundaGes.Core.QueryFilters;

namespace FundaGes.Core.Interfaces
{
    public interface IUsuarioService
    {
        Usuarios GetUsuario(int id);
        UsuarioDtoOut GetUsuarioDto(int id);        
        //No exponer este metodo
        Usuarios GetUsuario(string usuario);
        //Usuarios GetUsuarioPorCuit(string Cuit);
        //No exponer este metodo
        //Usuarios GetUsuarioFundacion(string Cuit);
        Usuarios GetUsuarioMiembroFundacion(string Cuit);
        //No exponer este metodo
        IEnumerable<Usuarios> GetUsuarios(Expression<Func<Usuarios, bool>> filter = null,
                          Func<IQueryable<Usuarios>, IOrderedQueryable<Usuarios>> orderBy = null,
                          string includeProperties = "", int? take = null);
        Usuarios GetFirstUsuario(Expression<Func<Usuarios, bool>> filter = null,
                          Func<IQueryable<Usuarios>, IOrderedQueryable<Usuarios>> orderBy = null,
                          string includeProperties = "");
        Usuarios GetSingleUsuario(Expression<Func<Usuarios, bool>> filter = null,
                          Func<IQueryable<Usuarios>, IOrderedQueryable<Usuarios>> orderBy = null,
                          string includeProperties = "");
        IEnumerable<UsuarioDtoOut> GetUsuariosDto(UsuarioQueryFilter filters);
        Usuarios GetUsuario(ClaimsPrincipal User);
        Usuarios GetUsuarioVacunador(string Cuit);
        Task InsertUsuario(UsuarioDto UsuarioDto);
        Task<bool> UpdateUsuario(int id, UsuarioUpdateDto Usuario);
        Task<bool> DeleteUsuario(int id);
        bool ValidarUsuario(UserLogin userLogin);
    }
}
