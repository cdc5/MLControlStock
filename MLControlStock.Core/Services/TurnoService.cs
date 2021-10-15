using AutoMapper;
using MLControlStock.Core.DTOs;
using MLControlStock.Core.Entities;
using MLControlStock.Core.Exceptions;
using MLControlStock.Core.Interfaces;
using MLControlStock.Core.QueryFilters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace MLControlStock.Core.Services
{
    public class TurnoService //:ITurnoService
    {

        //private IUnitOfWork _UnitOfWork;
        //private IApiClient _ApiClient;
        //private readonly IMapper _Mapper;
        //private IUsuarioService _UsuarioService;
        //private IFundacionService _FundacionService;
        //private IVacunadorService _VacunadorService;
        //private IRenspaService _RenspaService;
        

        //public TurnoService(IUnitOfWork unitOfWork,IApiClient apiClient, IMapper mapper,
        //                    IUsuarioService usuarioService, IRenspaService RenspaService,
        //                    IFundacionService fundacionService, IVacunadorService vacunadorService )
        //{
        //    _UnitOfWork = unitOfWork;
        //    _ApiClient = apiClient;
        //    _Mapper = mapper;
        //    _UsuarioService = usuarioService;
        //    _FundacionService = fundacionService;
        //    _VacunadorService = vacunadorService;
        //    _RenspaService = RenspaService;            
        //}

        //public async Task InsertTurno(TurnosDto turnoDto)
        //{
        //    ValidarCuitNombreVacunador(turnoDto.VacunadorCuit, turnoDto.VacunadorNombre);

        //    var turno = _Mapper.Map<Turnos>(turnoDto);
        //    var Fundacion = _FundacionService.GetFundacionPorCuit(turnoDto.FundacionCuit);
        //    turno.FundacionId = Fundacion.Id;

        //    var usuCreador = _UsuarioService.GetUsuario(turnoDto.UsuarioCreador);
        //    turnoDto.UsuarioCreador = usuCreador.Id;
            
        //    var Vacunador = _VacunadorService.GetVacunadorPorCuit(turnoDto.VacunadorCuit);
        //    if (Vacunador != null)
        //        turno.VacunadorId = Vacunador.Id;


        //    turno.FechaCreacion = DateTime.Now;
        //    turno.Estado = Parametros.Pendiente.Id;
                        
        //    foreach (var renspaID in turnoDto.Renspas)
        //    {
        //        var renspa = await _RenspaService.GetRenspa(renspaID);
        //        if (renspa == null)
        //        {
        //            throw new BusinessException("No se encuentra registrado Renspa: " + renspaID);
        //        }
        //        var tr = new TurnosRenspas();
        //        tr.Turnos = turno;
        //        tr.Renspas = renspa;
        //        turno.TurnosRenspas.Add(tr);
        //    }
        //    await _UnitOfWork.TurnoRepository.Insert(turno);
        //    await _UnitOfWork.SaveChangesAsync();
        //}

        //public async Task<bool> DeleteTurno(int id)
        //{
        //    await _UnitOfWork.TurnoRepository.Delete(id);
        //    await _UnitOfWork.SaveChangesAsync();
        //    return true;
        //}

        //public async Task<Turnos> GetTurno(int id)
        //{
        //    //var a = await _ApiClient.Campañas();
        //    //var b = await _ApiClient.InfoActas();
        //    //var c = await _ApiClient.ConsultarActasPendientes();
        //    return await _UnitOfWork.TurnoRepository.GetByID(id);
        //}

        //public IEnumerable<Turnos> GetTurnos(TurnoQueryFilter filters)
        //{
        //    DateTime Fecha = DateTime.Now.Date;
        //    var Turnos = _UnitOfWork.TurnoRepository.Get(x=>(x.Estado == Parametros.Pendiente.Id) || (x.Estado != (int)Parametros.Pendiente.Id
        //                                                && x.FechaTurnoVacunacion >= Fecha),null, "TurnosRenspas,EstadoNavigation");
        //    //if (filters.UsuarioCreadorID != null)
        //    //{
        //    //    Turnos = Turnos.Where(t => t.UsuarioCreador == filters.UsuarioCreadorID);
        //    //}           
            
        //    //if (filters.CuitUsuarioCreador != null)
        //    //{
        //    //    var usuario = _UsuarioService.GetUsuarioPorCuit(filters.CuitUsuarioCreador);
        //    //    Turnos = Turnos.Where(t => t.UsuarioCreador == usuario.Id);                
        //    //}
            
        //    if (filters.CuitFundacion != null)
        //    {
        //        Turnos = Turnos.Where(t => t.FundacionCuit == filters.CuitFundacion);
        //    }
            
        //    if (filters.CuitVacunador != null)
        //    {
        //        Turnos = Turnos.Where(t => t.VacunadorCuit == filters.CuitVacunador);
        //    }
        //    return Turnos;
        //}

        //public IEnumerable<TurnosDtoOut> GetTurnosDto(TurnoQueryFilter filters)
        //{
        //    var Turnos = GetTurnos(filters);
        //    var TurnosDto = _Mapper.Map<IEnumerable<TurnosDtoOut>>(Turnos);
        //    return TurnosDto;
        //}

        //public async Task<bool> UpdateTurno(int id, TurnosUpdateDto turnoDto)
        //{
        //    ValidarCuitNombreVacunador(turnoDto.cuitVacunador,turnoDto.nombreVacunador);

        //     Turnos turno = await _UnitOfWork.TurnoRepository.GetByID(id);
        //    if (turno != null)
        //    {
        //        turno.Id = id;
        //        if (!String.IsNullOrEmpty(turnoDto.EstadoNombre)) 
        //            turno.Estado = Parametros.GetEstadoID(turnoDto.EstadoNombre);
        //        if (turnoDto.Fecha != null)
        //            turno.FechaTurnoVacunacion = turnoDto.Fecha;
        //        if (turnoDto.Hora != null)
        //            turno.HoraTurnoVacunacion = turnoDto.Hora;
                
        //        if (!String.IsNullOrEmpty(turnoDto.cuitVacunador) && !String.IsNullOrEmpty(turnoDto.nombreVacunador))
        //        {
        //            var Vacunador = _VacunadorService.GetVacunadorPorCuit(turnoDto.cuitVacunador);
        //            if (Vacunador != null)
        //                turno.VacunadorId = Vacunador.Id;
        //            else
        //                turno.VacunadorId = null;
        //            turno.VacunadorCuit = turnoDto.cuitVacunador;
        //            turno.VacunadorNombre = turnoDto.nombreVacunador;
        //        }                      

        //        _UnitOfWork.TurnoRepository.Update(turno);
        //        await _UnitOfWork.SaveChangesAsync();
        //        return true;
        //    }
        //    else
        //        throw new BusinessException("No existe el turno ID: " + id);
        //}

        //private void ValidarCuitNombreVacunador(string cuitVacunador,string nombreVacunador)
        //{
        //    if (((!String.IsNullOrEmpty(cuitVacunador)) && (String.IsNullOrEmpty(nombreVacunador)))
        //        || (String.IsNullOrEmpty(cuitVacunador)) && (!String.IsNullOrEmpty(nombreVacunador)))
        //    {
        //        throw new BusinessException("Los campos CuitVacunador y NombreVacunador deben estar los dos completos o en blanco");
        //    }
        //}




    }
}
