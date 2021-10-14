using AutoMapper;
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
    public class UsuarioService:IUsuarioService
    {
        private IUnitOfWork _UnitOfWork;
        private IApiClient _ApiClient;
        private readonly IMapper _Mapper;        
        private IFundacionService _fundacionService;


        public UsuarioService(IUnitOfWork unitOfWork, IApiClient ApiClient, IMapper mapper,IFundacionService fundacionService)
        {
            _UnitOfWork = unitOfWork;
            _ApiClient = ApiClient;
            _Mapper = mapper;            
            _fundacionService = fundacionService;

        }

        public async Task InsertUsuario(UsuarioDto UsuarioDto)
        {
            var usuexiste = GetFirstUsuario(x => x.Usuario == UsuarioDto.Cuit);
            if (usuexiste != null)
                throw new BusinessException("Ya existe el usuario: " + UsuarioDto.Cuit);

            int TipoUsuarioID = Parametros.GetTipoUsuarioID(UsuarioDto.TipoUsuarioNombre);
            var usuario = _Mapper.Map<Usuarios>(UsuarioDto);
            usuario.TipoUsuario = TipoUsuarioID;
            usuario.FechaCreacion = DateTime.Now;
            usuario.Usuario = UsuarioDto.Cuit;
            var Fundacion = _fundacionService.GetFundacionPorCuit(UsuarioDto.CuitFundacion);

            if (TipoUsuarioID == Parametros.Fundacion.Id)
            {
                MiembrosFundacion mf = new MiembrosFundacion();
                mf.Cuit = UsuarioDto.Cuit;
                mf.FechaCreacion = DateTime.Now;
                mf.Nombre = UsuarioDto.Nombre;
                mf.Usuario = usuario;                
                usuario.FundacionId = Fundacion.Id;
                mf.FundacionId = Fundacion.Id;
                await _UnitOfWork.MiembroFundacionRepository.Insert(mf);
                //Fundaciones fund = new Fundaciones();
                //fund.Cuit = UsuarioDto.Cuit;
                //fund.FechaCreacion = DateTime.Now;
                //fund.Nombre = UsuarioDto.Nombre;
                //await _UnitOfWork.FundacionRepository.Insert(fund);
                //await _UnitOfWork.SaveChangesAsync();
                //fund.Usuario = usuario;
                //usuario.FundacionId = fund.Id;
            }
            else if (TipoUsuarioID == Parametros.Vacunador.Id)
            {
                Vacunadores vac = new Vacunadores();
                vac.Cuit = UsuarioDto.Cuit;
                vac.FechaCreacion = DateTime.Now;
                vac.Nombre = UsuarioDto.Nombre;
                vac.Usuario = usuario;
                usuario.FundacionId = Fundacion.Id;
                vac.FundacionId = Fundacion.Id;                
                await _UnitOfWork.VacunadorRepository.Insert(vac);
            }
            else
                throw new BusinessException("El tipo de usuario que se desea ingresar es erroneo:" + UsuarioDto.TipoUsuarioNombre);
                        
            await _UnitOfWork.UsuarioRepository.Insert(usuario);
            await _UnitOfWork.SaveChangesAsync();
        }

        public async Task<bool> DeleteUsuario(int id)
        {
            await _UnitOfWork.UsuarioRepository.Delete(id);
            await _UnitOfWork.SaveChangesAsync();
            return true;
        }

        public Usuarios GetUsuario(int id)
        {
            var usuario = GetFirstUsuario(x => x.Id == id, null, "TipoUsuarioNavigation,Fundacion,Vacunadores,MiembrosFundacion");
            if (usuario == null)
                throw new BusinessException(String.Format("El usuario {0} no existe", usuario));            
            return usuario;
        }

        public UsuarioDtoOut GetUsuarioDto(int id)
        {
            var usuario = GetUsuario(id);
            var usuarioDtoOut = _Mapper.Map<UsuarioDtoOut>(usuario);
            return usuarioDtoOut;
        }

        public Usuarios GetUsuario(string usuario)
        {
            var usu = GetFirstUsuario(x => x.Usuario == usuario,null, "TipoUsuarioNavigation,Fundacion,Vacunadores,MiembrosFundacion");
            if (usu == null)
                throw new BusinessException(String.Format("El usuario {0} no existe", usuario));            
            return usu;
        }



        public IEnumerable<Usuarios> GetUsuarios(Expression<Func<Usuarios, bool>> filter = null,
                          Func<IQueryable<Usuarios>, IOrderedQueryable<Usuarios>> orderBy = null,
                          string includeProperties = "", int? take = null)
        {
            var usuario = _UnitOfWork.UsuarioRepository.Get(filter, orderBy, includeProperties);
            return usuario;
        }

        public Usuarios GetFirstUsuario(Expression<Func<Usuarios, bool>> filter = null,
                          Func<IQueryable<Usuarios>, IOrderedQueryable<Usuarios>> orderBy = null,
                          string includeProperties = "")
        {
            var usuario = GetUsuarios(filter, orderBy, includeProperties).FirstOrDefault();            
            return usuario;
        }

        public Usuarios GetSingleUsuario(Expression<Func<Usuarios, bool>> filter = null,
                          Func<IQueryable<Usuarios>, IOrderedQueryable<Usuarios>> orderBy = null,
                          string includeProperties = "")
        {
            var usuario = GetUsuarios(filter, orderBy, includeProperties).SingleOrDefault();
            return usuario;
        }

        public IEnumerable<UsuarioDtoOut> GetUsuariosDto(UsuarioQueryFilter filters)
        {
            var usuarios = GetUsuarios(null, null, "TipoUsuarioNavigation,Fundacion,Vacunadores,MiembrosFundacion");
            if (filters.CuitFundacion != null)
            {
                var Fundacion = _fundacionService.GetFundacionPorCuit(filters.CuitFundacion);
                usuarios = usuarios.Where(x => x.FundacionId == Fundacion.Id);
            }
            var usuarioDtoOut = _Mapper.Map<IEnumerable<UsuarioDtoOut>>(usuarios);            
            return usuarioDtoOut;
        }

        public Usuarios GetUsuario(ClaimsPrincipal User)
        {
            //var email = User.Claims.Where(x => x.Type == ClaimTypes.Email).FirstOrDefault()?.Value;
            //var userid = User.Claims.Where(x => x.Type == "id").FirstOrDefault()?.Value;
            int userid = System.Convert.ToInt32(User.Claims.Where(x => x.Type == "IDUsuarioLogueado").FirstOrDefault()?.Value);
            var usuario = GetSingleUsuario(x => x.Id == userid,null, "TipoUsuarioNavigation,Fundacion,Vacunadores,MiembrosFundacion");
            if (usuario == null)
                throw new BusinessException(String.Format("No se ha encontrado el usuarui IDLogueado", userid));
            else
                return usuario;                    
        }
        //Este metodo nunca deberia devolverse al exterior,//No exponer este metodo
        //public Usuarios GetUsuarioPorCuit(string Cuit, string TipoUsuario)
        //{
        //    Usuarios usu;
        //    var Fundacion = _UnitOfWork.FundacionRepository.GetFundacionPorCuit(Cuit);
            
        //    if (Fundacion != null)
        //        usu =  Fundacion.Usuario;
        //    else
        //    {
        //        var Vacunador = _UnitOfWork.VacunadorRepository.GetVacunadorPorCuit(Cuit);
        //        if (Vacunador != null)
        //            usu =  Vacunador.Usuario;
        //        else
        //            throw new BusinessException("El Cuit proporcionado no corresponde a un Vacunador registrado");
        //    }

        //    if (usu != null)
        //        return usu;
        //    else
        //        throw new BusinessException("No existe usuario para el Cuit proporcionado");
        //}
        ////No exponer este metodo
        ///
        //public Usuarios GetUsuarioFundacion(string Cuit)
        //{
        //    var Fundacion = _fundacionService.GetFundacionPorCuit(Cuit);
        //    if (Fundacion != null)         
        //        if (Fundacion.Usuario != null)
        //            return Fundacion.Usuario;
        //        else
        //            throw new BusinessException(String.Format("Error grave: El usuario asignado a la Fundación con CUIT:{0} No posee ID de fundación asignado", Cuit));
        //    else
        //        throw new BusinessException("El Cuit proporcionado no corresponde a una Fundacion registrada");            
        //}
        //No exponer este metodo

        public Usuarios GetUsuarioMiembroFundacion(string Cuit)
        {
            var mf = _UnitOfWork.MiembroFundacionRepository.GetMiembroPorCuit(Cuit);
            if (mf != null)
                return mf.Usuario;
            return null;
        }

        public Usuarios GetUsuarioVacunador(string Cuit)
        {
            var Vacunador = _UnitOfWork.VacunadorRepository.GetVacunadorPorCuit(Cuit);
            if (Vacunador != null)
                return Vacunador.Usuario;
            return null;
        }

        public async Task<bool> UpdateUsuario(int id,UsuarioUpdateDto Usuario)
        {
            Usuarios usu = await _UnitOfWork.UsuarioRepository.GetByID(id);
            if (usu != null)
            {
                usu.Id = id;
                usu.Pass = Usuario.Pass;
                _UnitOfWork.UsuarioRepository.Update(usu);
                await _UnitOfWork.SaveChangesAsync();
                return true;
            }
            else
                throw new BusinessException("No existe el Usuario ID: " + id);
        }


        public bool ValidarUsuario(UserLogin userLogin)
        {
            var usuario = GetSingleUsuario(u => u.Usuario == userLogin.Usuario);            
            if (usuario != null)
            {
                if (usuario.Pass == userLogin.Pass)
                    return true;
                else
                    throw new BusinessException("Contraseña incorrecta");
            }
            else                
                throw new BusinessException(String.Format("El usuario {0} no existe", userLogin.Usuario));            
        }


    }
}
