using AutoMapper;
using MLControlStock.Core.ApiClient.Content;
using MLControlStock.Core.ApiClient.Dtos;
using MLControlStock.Core.DTOs;
using MLControlStock.Core.Entities;
using MLControlStock.Core.Exceptions;
using MLControlStock.Core.Interfaces;
using MLControlStock.Core.QueryFilters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Security.Claims;
using System.Threading.Tasks;

namespace MLControlStock.Core.Services
{
    public class StockService: IStockService
    {
        private IUnitOfWork _UnitOfWork;
        private IApiClient _ApiClient;
        private readonly IMapper _Mapper;

        public StockService(IUnitOfWork unitOfWork, IMapper mapper, IApiClient ApiClient)
        {
            _UnitOfWork = unitOfWork;
            _ApiClient = ApiClient;
            _Mapper = mapper;    
        }

        public async Task<IEnumerable<Stock>> GetStock(string deposito,string ubicacion)
        {
            var stock = _UnitOfWork.StockRepository.Get(x => x.Deposito == deposito);
            if (stock != null)
                throw new BusinessException(String.Format("No se encuentran productos en la ubicación {0}-{1}",deposito,ubicacion));
            return stock;
        }

        public async Task<IEnumerable<Stock>> GetStockPorProducto(string deposito, string producto)
        {
            var stock = _UnitOfWork.StockRepository.Get(x => x.Deposito == deposito && x.ProductId == producto);
            if (stock != null)
                throw new BusinessException(String.Format("No se encuentran el producto {0} en el depósito {1}", producto, deposito));
            return stock;
        }

        private async Task InsertProducto(string deposito, string ubicacion,string producto,int cantidad)
        {
            if (!ValidarUbicacion(ubicacion))
                throw new BusinessException(String.Format("La ubicación:{0} no cumple con el formato requerido {{{Area}}}-{{{Pasillo}}}-{{{Fila}}}-{{{Cara}}}", ubicacion));

            if (!EstaEnDeposito(producto))
                throw new BusinessException(String.Format("La ubicación:{0} no cumple con el formato requerido {{{Area}}}-{{{Pasillo}}}-{{{Fila}}}-{{{Cara}}}", ubicacion));

            Ubicacion ubi = new Ubicacion(ubicacion);
            Stock stock = new Stock();
            stock.Deposito = deposito;
            stock.Area = ubi.Area;
            stock.Pasillo = ubi.Pasillo;
            stock.Fila = ubi.Fila;
            stock.Cara = ubi.Cara;
            stock.ProductId = producto;
            stock.Cantidad = cantidad;
            
            await _UnitOfWork.StockRepository.Insert(stock);
            await _UnitOfWork.SaveChangesAsync();
        }

        private bool ValidarUbicacion(string ubicacion)
        {
            return true;
        }

        private bool EstaEnDeposito(string producto)
        {
            return true;
        }
        //private async Task CargarNombresAnimales<T>(ICollection<T> animales,ClaimsPrincipal User, bool PorCodigo = false) where T:IActasAnimales 
        //{

        //    bool traerAnimales = false;
        //    Animales Animal = null;

        //    var AnimalesBase = await _AnimalesService.GetAnimales();
        //    foreach(var an in animales)
        //    {
        //        var anBase = AnimalesBase.SingleOrDefault(x => x.id == an.AnimalesID);
        //        if (anBase == null)
        //        {
        //            traerAnimales = true;
        //            break;
        //        }
        //    }

        //    if (traerAnimales)
        //        await _AnimalesService.CargarCategoriaAnimalesFaltantesEnBase(User);

        //    if (!PorCodigo)
        //    {
        //        foreach (IActasAnimales ani in animales)
        //        {
        //            Animal = _AnimalesService.GetAnimal(ani.AnimalesID).Result;
        //            if (Animal != null)
        //            {
        //                ani.AnimalesNombre = Animal.Nombre;
        //                ani.AnimalesCodigo = Animal.Codigo;
        //            }
        //        }
        //    }
        //    else
        //    {
        //        foreach (IActasAnimales ani in animales)
        //        {
        //            Animal = _AnimalesService.GetAnimal(ani.AnimalesCodigo).Result;
        //            if (Animal != null)
        //            {
        //                ani.AnimalesNombre = Animal.Nombre;
        //                ani.AnimalesID = Animal.id;
        //            }
        //        }
        //    }





        //}

        //public async Task<bool> DeleteActa(string codigo, ClaimsPrincipal User)
        //{
        //    var Acta = await GetActa(codigo, User);
        //    if (Acta == null)
        //        throw new BusinessException(String.Format("No se encuentra el acta con código:{0}", codigo));

        //    Acta.ActasAnimales = null;
        //    Acta.ActasAnimalesDDJJ = null;
        //    await _UnitOfWork.ActaRepository.Delete(Acta.Codigo);
        //    await _UnitOfWork.SaveChangesAsync();
        //    return true;
        //}



        //public async Task<IEnumerable<ApiActasDto>> GetActasSenasa(string campania,  ClaimsPrincipal User)
        //{
        //    var usuario = _UsuarioService.GetUsuario(User);
        //    ActasContent apc = new ActasContent(usuario.Fundacion.Cuit, usuario.Fundacion.wsUsername, usuario.Fundacion.TokenSenasa,campania);
        //    var actas = await _ApiClient.Actas(apc);
        //    return actas;
        //}

        //public async Task<IEnumerable<ApiActasPendientesDto>> GetActaSenasa(string campania, string codigo,ClaimsPrincipal User)
        //{
        //    var usuario = _UsuarioService.GetUsuario(User);
        //    ActaContent apc = new ActaContent(usuario.Fundacion.Cuit, usuario.Fundacion.wsUsername, usuario.Fundacion.TokenSenasa, campania,codigo);
        //    var actas = await _ApiClient.Acta(apc);
        //    return actas;
        //}

        //public async Task<IEnumerable<ApiActasPendientesDto>> GetActasPendientesSenasa(string campania,ClaimsPrincipal User)
        //{
        //    var usuario = _UsuarioService.GetUsuario(User);
        //    ActasPendientesContent apc = new ActasPendientesContent(usuario.Fundacion.Cuit, usuario.Fundacion.wsUsername, usuario.Fundacion.TokenSenasa, campania);
        //    var actasPend = await _ApiClient.ActasPendientes(apc);
        //    foreach (var acta in actasPend)
        //    {
        //        acta.Estado = Parametros.Pendiente.Nombre;
        //    }
        //    return actasPend;
        //}

        //public async Task<IEnumerable<ApiActasPendientesDto>> GetActasPendientesFundacion(string campania, ClaimsPrincipal User)
        //{
        //    var usuario = _UsuarioService.GetUsuario(User);
        //    var actas = await GetActas(x => x.FundacionId == usuario.FundacionId && x.Estado == Parametros.PendienteEnFundacion.Id
        //                                && x.CampaniaCarga == campania);            
        //    var actasDto = _Mapper.Map<List<ApiActasPendientesDto>>(actas);
        //    return actasDto;
        //}


        //public async Task<IEnumerable<ApiActasPendientesDto>> GetActasPendientes(string campania, ClaimsPrincipal User)
        //{
        //    var actasPendSenasa = (await GetActasPendientesSenasa(campania, User)).ToList();
        //    var actasPendFun = (await GetActasPendientesFundacion(campania, User)).ToList();
        //    actasPendSenasa.AddRange(actasPendFun);
        //    return actasPendSenasa;
        //}

        //public async Task<bool> UpdateActa(ActaUpdateDto ActaUpdateDto, ClaimsPrincipal User)
        //{

        //    var actaEsta = await GetActa(ActaUpdateDto.Codigo, User);
        //    if (actaEsta == null)
        //        throw new BusinessException("No existe el acta con codigo:" + ActaUpdateDto.Codigo);

        //    var Acta = _Mapper.Map<Actas>(ActaUpdateDto);
        //    actaEsta.Renspa = Acta.Renspa;
        //    actaEsta.FechaVacunacion = Acta.FechaVacunacion;
        //    actaEsta.CampaniaCarga = Acta.CampaniaCarga;
        //    actaEsta.Vacuna = Acta.Vacuna;
        //    actaEsta.NumeroSerie = Acta.NumeroSerie;
        //    actaEsta.CantidadDosis = Acta.CantidadDosis;
        //    actaEsta.EsActaTotal = Acta.EsActaTotal;
        //    actaEsta.Vacunador = Acta.Vacunador;
        //    actaEsta.VacunaBrucelosis = Acta.VacunaBrucelosis;
        //    actaEsta.NumeroSerieBrucelosis = Acta.NumeroSerieBrucelosis;
        //    actaEsta.DosisBrucelosis = Acta.DosisBrucelosis;
        //    actaEsta.Carbunclo = Acta.Carbunclo;
        //    actaEsta.CantidadVacunadosBrucelosis = Acta.CantidadVacunadosBrucelosis;
        //    actaEsta.CantidadBubVacunadosBrucelosis = Acta.CantidadBubVacunadosBrucelosis;

        //    actaEsta.ActasAnimales = Acta.ActasAnimales;
        //    actaEsta.ActasAnimalesDDJJ = Acta.ActasAnimalesDDJJ; 

        //    _UnitOfWork.ActaRepository.Update(actaEsta);
        //    await _UnitOfWork.SaveChangesAsync();
        //    return true;
        //}

        //public async Task<bool> UpdateActaID(string codigo, long id, ClaimsPrincipal User)
        //{

        //    var actaEsta = await GetActa(codigo, User);
        //    if (actaEsta == null)
        //        throw new BusinessException("No existe el acta con codigo:" + codigo);

        //    actaEsta.Id = id;
        //    _UnitOfWork.ActaRepository.Update(actaEsta);
        //    await _UnitOfWork.SaveChangesAsync();
        //    return true;
        //}


        //    //Sirve para Anular o confirmar un acta, si el estado pasado como parametro es "Confirmado" se realiza la solicitudo al Endpoint senasa para confirmar
        //    //y luego se confirmar el acta de fundación en BD, y se agrega el Acta ID proveniente de SENASA
        //    // Si el estado es Anulado, sencillamente se cambia estado en BD. No se llama a Endpoint SENASA ya que el acta no se encuentra en SENASA
        //    //devuelve el numero de acta confirmada/anulada en caso positivo o excepcion en caso de error
        //public async Task<long> CambiarEstadoActaFundacion(string codigo, ActaEstadoDto ActaEstadoDto, ClaimsPrincipal User)
        //{
        //    long result = -1;
        //    var usuario = _UsuarioService.GetUsuario(User);
        //    long? res = null;
        //    Actas acta = await GetActa(codigo,User);
        //    if (acta != null)
        //    {
        //        if (!String.IsNullOrEmpty(ActaEstadoDto.Estado))
        //        {
        //            acta.Estado = Parametros.GetEstadoID(ActaEstadoDto.Estado);
        //            if (ActaEstadoDto.Estado == Parametros.Confirmada.Nombre)
        //            {
        //                GuardarActaContent gac = _Mapper.Map<GuardarActaContent>(acta);
        //                gac.wsUsername = usuario.Fundacion.wsUsername;
        //                gac.wsToken = usuario.Fundacion.TokenSenasa;                        
        //                var resp = await _ApiClient.GuardarActa(gac);
        //                res = System.Convert.ToInt64(resp);
        //                acta.Id = res;
        //                result = res.Value;
        //                //si cargar acta no confirma directamente
        //                //ConfirmarActaContent cac = new ConfirmarActaContent(usuario.Fundacion.Cuit, usuario.Fundacion.Cuit, usuario.Fundacion.TokenSenasa, id.ToString());
        //                //res = System.Convert.ToInt64(await _ApiClient.ConfirmarActa(cac));
        //                //Cargar acta en senasa
        //                //Actualizar estado de acta en fundacion
        //            }
        //        }
        //        else
        //            throw new BusinessException("El campo Estado debe estar completo");

        //        _UnitOfWork.ActaRepository.Update(acta);
        //        await _UnitOfWork.SaveChangesAsync();
        //        return result;
        //    }
        //    else
        //        throw new BusinessException("No existe el acta Codigo: " + codigo);
        //}

        //public async Task<long?> CambiarEstadoActaSenasa(long id,string codigo,string campania,string Estado, ClaimsPrincipal User)
        //{
        //    long? res = null;
        //    var usuario = _UsuarioService.GetUsuario(User);
        //    var actaEsta = await GetActa(codigo, User);
        //    if (actaEsta != null)
        //    {
        //        if (Estado == Parametros.Confirmada.Nombre)
        //        {
        //            if (actaEsta.Estado == Parametros.Confirmada.Id)
        //                throw new BusinessException(String.Format("El acta {0} ya se encuentra registrada y confirmada en en la base de datos, no es necesario confirmarla", codigo));
        //            else
        //                throw new BusinessException(String.Format("El acta {0} ya se encuentra registrada y Anulada en en la base de datos, cargue un nuevo acta", codigo));

        //        }
        //        else if (Estado == Parametros.Anulada.Nombre)
        //        {
        //            if (actaEsta.Estado == Parametros.Anulada.Id)
        //                throw new BusinessException(String.Format("El acta {0} ya se encuentra registrada y anulada en en la base de datos, no es necesario confirmarla", codigo));
        //            else
        //                throw new BusinessException(String.Format("El acta {0} ya se encuentra registrada y confirmada en en la base de datos, no es posible anularla", codigo)); //revisar si esto es asi
        //        }
        //    }
        //    else
        //    {
        //        if (Estado == Parametros.Confirmada.Nombre)
        //        {
        //            ConfirmarActaContent cac = new ConfirmarActaContent(usuario.Fundacion.Cuit, usuario.Fundacion.Cuit, usuario.Fundacion.TokenSenasa, id.ToString());
        //            res = System.Convert.ToInt64(await _ApiClient.ConfirmarActa(cac));

        //            ActaContent ac = new ActaContent(usuario.Fundacion.Cuit, usuario.Fundacion.wsUsername, usuario.Fundacion.TokenSenasa, campania, codigo);
        //            var actas = await _ApiClient.Acta(ac);
        //            if (actas != null && actas.Count > 0)
        //            {
        //                var actaConfirmada = actas.First();
        //                var actaAguardar = _Mapper.Map<Actas>(actaConfirmada);                       
        //                actaAguardar.Id = res;
        //                await InsertActa(actaAguardar,Parametros.Confirmada.Id,User,true);
        //            }                        
        //            else
        //                throw new BusinessException(String.Format("El Acta {0} no se ha encontrado", res));                    

        //            return res.Value;
        //        }
        //        else if (Estado == Parametros.Anulada.Nombre)
        //        {
        //            AnularActaContent aac = new AnularActaContent(usuario.Fundacion.wsUsername, usuario.Fundacion.TokenSenasa, id.ToString());
        //            await _ApiClient.AnularActa(aac);
        //            return -1;
        //        }
        //    }
        //    return null;
        //}
    }
}
