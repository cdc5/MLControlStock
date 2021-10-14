using AutoMapper;
using FundaGes.Core.DTOs;
using FundaGes.Core.Entities;
using FundaGes.Core.Exceptions;
using FundaGes.Core.Interfaces;
using FundaGes.Core.QueryFilters;
using FundaGes.Core.ApiClient.Content;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using System.Security.Claims;
using FundaGes.Core.ApiClient.Dtos;

namespace FundaGes.Core.Services
{
    public class VacunaService : IVacunaService
    {
        private IUnitOfWork _UnitOfWork;
        private IApiClient _ApiClient;
        private readonly IMapper _Mapper;
        private IUsuarioService _UsuarioService;
        private IHeladeraService _HeladeraService;
        private ITurnoService _TurnoService;

        public VacunaService(IUnitOfWork unitOfWork, IApiClient apiClient, IMapper mapper
                             , IUsuarioService UsuarioService, IHeladeraService heladeraService, ITurnoService turnoService)
        {
            _UnitOfWork = unitOfWork;
            _ApiClient = apiClient;
            _Mapper = mapper;
            _UsuarioService = UsuarioService;
            _HeladeraService = heladeraService;
            _TurnoService = turnoService;
        }

        //VacunasStock
        public async Task InsertVacunaStock(VacunaStockDto VacunaStockDto, ClaimsPrincipal User)
        {
            if (VacunaStockDto.VacunasId == null)
                throw new BusinessException("La carga de stock de vacunas debe incluir un ID de vacuna (VacunaID");

            var Hel = _HeladeraService.GetHeladera(VacunaStockDto.HeladeraId.Value);
            if (Hel == null)
                throw new BusinessException(String.Format("No se encuentra la heladera:{0}", VacunaStockDto.HeladeraId.Value));

            var usuario = _UsuarioService.GetUsuario(User);
            var Vac = GetVacuna(VacunaStockDto.VacunasId.Value);
            if (Vac == null)
            {
                TokenSenasaContent apc = new TokenSenasaContent(usuario.Fundacion.Cuit, usuario.Fundacion.wsUsername, usuario.Fundacion.TokenSenasa);
                var listaVacunas = await _ApiClient.Vacunas(apc);
                if (listaVacunas != null)
                {
                    var ApiVac = listaVacunas.Where(x => x.id == VacunaStockDto.VacunasId).FirstOrDefault();
                    if (ApiVac != null)
                    {
                        Vac = _Mapper.Map<Vacunas>(ApiVac);
                        await InsertVacuna(Vac);
                    }
                    else
                        throw new BusinessException(String.Format("No se ha encontrado la vacuna ID {0} en la listas de vacunas de Endpoint Senasa", VacunaStockDto.VacunasId));
                }
                else
                    throw new BusinessException("No se ha podido recuperar la listas de vacunas de Endpoint Senasa");
            }
            var VacStock = _Mapper.Map<VacunasStock>(VacunaStockDto);
            VacStock.SubcentroId = Hel.SubcentroId;
            VacStock.FechaCreacion = DateTime.Now;
            VacStock.FundacionId = usuario.FundacionId;
            await _UnitOfWork.VacunasStockRepository.Insert(VacStock);
            await _UnitOfWork.SaveChangesAsync();
        }


        public async Task InsertVacunaStock(VacunasStock VacunaStock)
        {
            await _UnitOfWork.VacunasStockRepository.Insert(VacunaStock);
            await _UnitOfWork.SaveChangesAsync();
        }

        public async Task<bool> DeleteVacunaStock(int id)
        {
            var VacStock = await GetVacunaStock(id);
            if (VacStock == null)
                throw new BusinessException(String.Format("No se ha encontrado el stock de Vacunas con id:{0}", id));

            await _UnitOfWork.VacunasStockRepository.Delete(id);
            await _UnitOfWork.SaveChangesAsync();
            return true;
        }

        public async Task<VacunasStock> GetVacunaStock(int id)
        {
            var VacunaStock = await _UnitOfWork.VacunasStockRepository.GetByID(id);
            return VacunaStock;
        }

        public VacunasStock GetVacunaStock(int id, ClaimsPrincipal User)
        {
            var usuario = _UsuarioService.GetUsuario(User);
            var VacunaStock = _UnitOfWork.VacunasStockRepository.GetFirst(x => x.Id == id && x.FundacionId == usuario.Fundacion.Id, "Heladera,Subcentro,Vacunas");
            return VacunaStock;
        }

        public VacunasStockDtoOut GetVacunaStockDto(int id, ClaimsPrincipal User)
        {
            var usuario = _UsuarioService.GetUsuario(User);
            var VacunaStock = GetVacunasStock(x => x.Id == id && x.FundacionId == usuario.Fundacion.Id,null, "Heladera,Subcentro,Vacunas").FirstOrDefault();
            var VacunasStockDtoOut = _Mapper.Map<VacunasStockDtoOut>(VacunaStock);
            return VacunasStockDtoOut;
        }

        public IEnumerable<VacunasStock> GetVacunasStock(Expression<Func<VacunasStock, bool>> filter = null,
                          Func<IQueryable<VacunasStock>, IOrderedQueryable<VacunasStock>> orderBy = null,
                          string includeProperties = "", int? take = null)
        {
            var VacStocks = _UnitOfWork.VacunasStockRepository.Get(filter, orderBy, includeProperties, take);
            return VacStocks;
        }
                           
        public IEnumerable<VacunasStockDtoOut> GetVacunasStockDto(VacunasStockQueryFilter filters, ClaimsPrincipal User)
        {
            var usuario = _UsuarioService.GetUsuario(User);
            var VacStocks = GetVacunasStock(x => x.FundacionId == usuario.FundacionId, null, "Heladera,Subcentro,Vacunas");
            if (filters.VacunaID != null)
            {
                VacStocks = VacStocks.Where(x => x.VacunasId == filters.VacunaID);
            }
            var VacStocksDto = _Mapper.Map<IEnumerable<VacunasStockDtoOut>>(VacStocks);
            return VacStocksDto;
        }

        public async Task<bool> UpdateVacunasStock(VacunaStockUpdateDto VacunaStockUpdateDto)
        {
            var VacStock = await GetVacunaStock(VacunaStockUpdateDto.Id);
            if (VacStock == null)
                throw new BusinessException(String.Format("No se ha encontrado el stock de Vacunas con id:{0}", VacunaStockUpdateDto.Id));

            VacStock.Cantidad = VacunaStockUpdateDto.Cantidad;
            VacStock.Partida = VacunaStockUpdateDto.Partida;
            VacStock.FechaVencimiento = VacunaStockUpdateDto.FechaVencimiento;
            UpdateVacunasStock(VacStock);
            return true;
        }

        public bool UpdateVacunasStock(VacunasStock VacunasStock)
        {
            _UnitOfWork.VacunasStockRepository.Update(VacunasStock);
            _UnitOfWork.SaveChangesAsync();
            _UnitOfWork.SaveChangesAsync();
            return true;
        }

        //Vacunas
        public async Task InsertVacuna(VacunaDto VacunaDto)
        {
            var Vac = _Mapper.Map<Vacunas>(VacunaDto);
            await InsertVacuna(Vac);
        }

        public async Task InsertVacuna(Vacunas Vac)
        {
            await _UnitOfWork.VacunasRepository.Insert(Vac);
            await _UnitOfWork.SaveChangesAsync();
        }

        public async Task<bool> DeleteVacuna(int id)
        {
            await _UnitOfWork.VacunasRepository.Delete(id);
            await _UnitOfWork.SaveChangesAsync();
            return true;
        }

        public Vacunas GetVacuna(int id)
        {
            var VacunaStock = _UnitOfWork.VacunasRepository.GetFirst(x => x.Id == id);
            return VacunaStock;
        }

        public VacunaDto GetVacunaDto(int id)
        {
            var Vacuna = GetVacuna(id);
            var VacunasDto = _Mapper.Map<VacunaDto>(Vacuna);
            return VacunasDto;
        }

        public IEnumerable<Vacunas> GetVacunas(Expression<Func<Vacunas, bool>> filter = null,
                          Func<IQueryable<Vacunas>, IOrderedQueryable<Vacunas>> orderBy = null,
                          string includeProperties = "", int? take = null)
        {
            var Vac = _UnitOfWork.VacunasRepository.Get(filter, orderBy, includeProperties, take);
            return Vac;
        }

        public async Task<IEnumerable<ApiVacunasDto>> GetVacunasSenasa(ClaimsPrincipal User)
        {
            var usuario = _UsuarioService.GetUsuario(User);
            TokenSenasaContent apc = new TokenSenasaContent(usuario.Fundacion.Cuit, usuario.Fundacion.wsUsername, usuario.Fundacion.TokenSenasa);
            var listaVacunas = await _ApiClient.Vacunas(apc);
            return listaVacunas;
        }

        public IEnumerable<VacunaDto> GetVacunasDto()
        {
            var Vacs = GetVacunas();
            var VacsDto = _Mapper.Map<IEnumerable<VacunaDto>>(Vacs);
            return VacsDto;
        }

        public bool UpdateVacuna(int id, VacunaDto VacunaDto)
        {
            var Vac = _Mapper.Map<Vacunas>(VacunaDto);
            Vac.Id = id;
            _UnitOfWork.VacunasRepository.Update(Vac);
            _UnitOfWork.SaveChangesAsync();
            return true;
        }

        //Entrega de vacunas (tablas turnos_vacunas)
        public async Task InsertEntregaRecepcionVacuna(EntregaRecepcionVacunaDto EntregaRecepcionVacunaDto, ClaimsPrincipal User)
        {
            Turnos Turno;
            var usuario = _UsuarioService.GetUsuario(User);
            var EntregaRecepcion = _Mapper.Map<TurnosVacunas>(EntregaRecepcionVacunaDto);
            var vacStock = GetVacunaStock(EntregaRecepcion.VacunasStockId, User);

            if (vacStock == null)
                throw new BusinessException(String.Format("No se encuentra el stock de vacuna con ID:{0}", EntregaRecepcion.VacunasStockId));

            if (EntregaRecepcionVacunaDto.TurnosId != null)
            {
                Turno = await _TurnoService.GetTurno(EntregaRecepcionVacunaDto.TurnosId.Value);
                if (Turno == null)
                    throw new BusinessException(String.Format("No se encuentra el turno:{0}", EntregaRecepcionVacunaDto.TurnosId));
                EntregaRecepcion.Turnos = Turno;
                EntregaRecepcion.VacunadorCuit = Turno.VacunadorCuit;
                EntregaRecepcion.VacunadorNombre = Turno.VacunadorNombre;
            }

            EntregaRecepcion.FundacionId = usuario.FundacionId;

            if (EntregaRecepcionVacunaDto.EsEntrega)
            {
                vacStock.DisminuirStock(EntregaRecepcion.CantidadEntregada.Value);
            }
            else
            {
                vacStock.IncrementarStock(EntregaRecepcion.CantidadDevolucion.Value);
            }

            _UnitOfWork.VacunasStockRepository.Update(vacStock);
            await _UnitOfWork.TurnosVacunasRepository.Insert(EntregaRecepcion);
            await _UnitOfWork.SaveChangesAsync();
        }

        public IEnumerable<TurnosVacunas> GetEntregasRecepcionVacunas(Expression<Func<TurnosVacunas, bool>> filter = null,
                         Func<IQueryable<TurnosVacunas>, IOrderedQueryable<TurnosVacunas>> orderBy = null,
                         string includeProperties = "", int? take = null)
        {
            var VacStocks = _UnitOfWork.TurnosVacunasRepository.Get(filter, orderBy, includeProperties, take);
            return VacStocks;
        }

        public async Task<TurnosVacunas> GetEntregaRecepcionVacunas(int id)
        {
            var VacStocks = await _UnitOfWork.TurnosVacunasRepository.GetByID(id);
            return VacStocks;
        }

        public async Task<TurnosVacunasDtoOut> GetEntregaRecepcionVacunasDto(int id)
        {
            var EntRec = await GetEntregaRecepcionVacunas(id);
            var EntRecDto = _Mapper.Map<TurnosVacunasDtoOut>(EntRec);
            return EntRecDto;
        }


        public IEnumerable<EntregaRecepcionVacunaDtoOut> GetEntregasRecepcionVacunas(ClaimsPrincipal User)
        {
            List<EntregaRecepcionVacunaDtoOut> lista = new List<EntregaRecepcionVacunaDtoOut>();
            EntregaRecepcionVacunaDtoOut Entrega;
            EntregaRecepcionVacunaDtoOut Devolucion;
            var usuario = _UsuarioService.GetUsuario(User);
            var TurnosVacunas = GetEntregasRecepcionVacunas(null,null, "VacunasStock,VacunasStock.Vacunas");
            foreach (var tv in TurnosVacunas)
            {
                if (tv.CantidadEntregada != null)
                {
                    Entrega = new EntregaRecepcionVacunaDtoOut();
                    Entrega.Turno = tv.TurnosId != null ? tv.TurnosId.ToString() : "NO VINCULADO";
                    Entrega.Partida = tv.VacunasStock.Partida.ToString();
                    Entrega.Vacuna = tv.VacunasStock.Vacunas.ToString();
                    Entrega.VacunadorCuit = tv.VacunadorCuit;
                    Entrega.VacunadorNombre = tv.VacunadorNombre;
                    Entrega.Dosis = tv.CantidadEntregada.Value;
                    Entrega.Fecha = tv.FechaEntrega;
                    Entrega.Temperatura = tv.TemperaturaSalida.Value;
                    Entrega.Tipo = Parametros.EntregaVacuna;
                    Entrega.Id = tv.Id;
                    lista.Add(Entrega);
                }                

                if (tv.CantidadDevolucion != null)
                {
                    Devolucion = new EntregaRecepcionVacunaDtoOut();
                    Devolucion.Turno = tv.TurnosId != null ? tv.TurnosId.ToString() : "NO VINCULADO";
                    Devolucion.Partida = tv.VacunasStock.Partida.ToString();
                    Devolucion.Vacuna = tv.VacunasStock.Vacunas.ToString();
                    Devolucion.VacunadorCuit = tv.VacunadorCuit;
                    Devolucion.VacunadorNombre = tv.VacunadorNombre;
                    Devolucion.Dosis = tv.CantidadDevolucion.Value;
                    Devolucion.Fecha = tv.FechaDevolucion;
                    Devolucion.Temperatura = tv.TemperaturaDevolucion.Value;
                    Devolucion.Tipo = Parametros.DevolucionVacuna;
                    Devolucion.Id = tv.Id;
                    lista.Add(Devolucion);
                }
            }
            return lista;
        }

        public async Task<bool> DeleteEntregaRecepcion(int id)
        {
            var EntRec = GetEntregasRecepcionVacunas(x => x.Id == id).SingleOrDefault();
            if (EntRec == null)
                throw new BusinessException(String.Format("No se encuentra el registro de entrega/recepción de vacunas ID:{0})", id));

            await _UnitOfWork.TurnosVacunasRepository.Delete(id);
            await _UnitOfWork.SaveChangesAsync();
            return true;
        }

        //Trasladar Vacunas
        public async Task<bool> TrasladarVacunas(int HelDesde, int HelHasta, int StockVacID, int cant,ClaimsPrincipal User)
        {
            var HelaDesde = _HeladeraService.GetHeladera(HelDesde);
            if (HelaDesde == null)
                throw new BusinessException(String.Format("No se encuentra la heladera de origen:{0}", HelDesde));

            var HelaHasta = _HeladeraService.GetHeladera(HelDesde);
            if (HelaHasta == null)
                throw new BusinessException(String.Format("No se encuentra la heladera de destino:{0}", HelaHasta));

            var StockVac = GetVacunaStock(StockVacID, User);
            if (StockVac == null)
                throw new BusinessException(String.Format("No se encuentra Stock de Vacunas:{0}", StockVac));

            if (cant > StockVac.Cantidad)
                throw new BusinessException(String.Format("La cantidad a transferir es mayor a la cantidad existente en stock", StockVac));

            if (cant <= StockVac.Cantidad)
            {
                //if (StockVac.TurnosVacunas != null && StockVac.TurnosVacunas.Count > 0)
                //    throw new BusinessException(String.Format("La cantidad a transferir es igual a la cantidad existente en stock y el stock tiene turnos asociados", StockVac));

                //Dejamos el stock en 0 porque puede pasar que se hayan entregado vacunas a algún vacunador y que devuelva alguna cantidad
                StockVac.DisminuirStock(StockVac.Cantidad.Value - cant);
                _UnitOfWork.VacunasStockRepository.Update(StockVac);

                VacunasStock nuevoStock = new VacunasStock();
                nuevoStock.Cantidad = cant;
                nuevoStock.FechaCreacion = DateTime.Now;
                nuevoStock.FundacionId = StockVac.FundacionId;
                nuevoStock.HeladeraId = StockVac.HeladeraId;
                nuevoStock.Partida = StockVac.Partida;
                nuevoStock.SubcentroId = StockVac.SubcentroId;
                nuevoStock.VacunasId = StockVac.VacunasId;
                await InsertVacunaStock(nuevoStock);
                await _UnitOfWork.SaveChangesAsync();
            }

            return true;

        }


    }
}
