using AutoMapper;
using MLControlStock.Core.DTOs;
using MLControlStock.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MLControlStock.Core.Interfaces;
using MLControlStock.Core.ApiClient.Dtos;
using MLControlStock.Core.ApiClient.Content;

namespace MLControlStock.Infrastructure.Mappings
{
    public class AutoMapperProfile:Profile
    {
        public AutoMapperProfile()
        {
            //CreateMap<Turnos,TurnosDto>(); 
            //CreateMap<TurnosDto,Turnos>();

            //CreateMap<Turnos, TurnosDtoOut>()
            //.ForMember(dest => dest.Renspas, opt => opt.MapFrom(so => so.TurnosRenspas.Select(t => t.RenspasId).ToList()))
            //.ForMember(dest => dest.EstadoNombre, opt => opt.MapFrom(so => so.EstadoNavigation.Nombre));
            //CreateMap<TurnosDtoOut, Turnos>();

            //CreateMap<TurnosDto, TurnosDtoOut>();
            //CreateMap<TurnosDtoOut, TurnosDto>();

            //CreateMap<Establecimiento, EstablecimientoDto>()
            //    .ForMember(dest => dest.Renspas, opt => opt.MapFrom(so => so.Renspas.Select(t => t.Renspa).ToList()));
            //CreateMap<EstablecimientoDto, Establecimiento>();

            //CreateMap<Usuarios, UsuarioDto>();
            //CreateMap<UsuarioDto, Usuarios>();

            //CreateMap<Usuarios, UsuarioDtoOut>()
            //        .ForMember(dest => dest.TipoUsuarioNombre, opt => opt.MapFrom(so => so.TipoUsuarioNavigation.Tipo))
            //        .ForMember(dest => dest.NombreUsuario, opt => opt.MapFrom(so => so.NombreUsuario));                    
            //CreateMap<UsuarioDtoOut, Usuarios>();

            //CreateMap<Vacunadores, VacunadorDto>();
            //CreateMap<VacunadorDto, Vacunadores>();

            //CreateMap<Vacunadores, VacunadorDtoOut>();
            //CreateMap<VacunadorDtoOut, Vacunadores>();

            //CreateMap<MiembrosFundacion, MiembroFundacionDto>();
            //CreateMap<MiembroFundacionDto, MiembrosFundacion>();

            //CreateMap<MiembrosFundacion, MiembroFundacionDtoOut>();
            //CreateMap<MiembroFundacionDtoOut, MiembrosFundacion>();

            //CreateMap<Fundaciones, FundacionDto>();
            //CreateMap<FundacionDto, Fundaciones>();

            //CreateMap<Fundaciones, FundacionDtoOut>();
            //CreateMap<FundacionDtoOut, Fundaciones>();

            //CreateMap<Subcentros, SubCentroDto>();
            //CreateMap<SubCentroDto, Subcentros>();

            //CreateMap<Subcentros, SubCentroDtoOut>();
            //CreateMap<SubCentroDtoOut, Subcentros>();

            //CreateMap<Heladeras, HeladeraDto>();
            //CreateMap<HeladeraDto, Heladeras>();

            //CreateMap<Heladeras, HeladeraDtoOut>();
            //CreateMap<HeladeraDtoOut, Heladeras>();

            //CreateMap<ApiActasPendientesDto, Actas>()
            //   .ForMember(dest => dest.CampaniaCarga, opt => opt.MapFrom(x => x.campaniaCarga))
            //   .ForMember(dest => dest.CantidadBubVacunadosBrucelosis, opt => opt.MapFrom(x => x.cantidadBubVacunadosBrucelosis))
            //   .ForMember(dest => dest.CantidadDosis, opt => opt.MapFrom(x => x.cantidadDosis))
            //   .ForMember(dest => dest.CantidadVacunadosBrucelosis, opt => opt.MapFrom(x => x.cantidadVacunadosBrucelosis))
            //   .ForMember(dest => dest.EsActaTotal, opt => opt.MapFrom(x => x.esActaTotal))
            //   .ForMember(dest => dest.NumeroSerie, opt => opt.MapFrom(x => x.numeroSerie))
            //   .ForMember(dest => dest.NumeroSerieBrucelosis, opt => opt.MapFrom(x => x.numeroSerieBrucelosis))
            //   .ForMember(dest => dest.Vacunador, opt => opt.MapFrom(x => x.vacunador))
            //   .ForMember(dest => dest.UsuarioCreador, opt => opt.MapFrom(x => x.usuarioCreador))
            //   .ForMember(dest => dest.UsuarioConfirmacion, opt => opt.MapFrom(x => x.usuarioConfirmacion))
            //   .ForMember(dest => dest.UsuarioAnulacion, opt => opt.MapFrom(x => x.usuarioAnulacion))
            //   .ForMember(dest => dest.RequiereConfirmacion, opt => opt.MapFrom(x => x.requiereConfirmacion))
            //   .ForMember(dest => dest.ActasAnimales, opt => opt.MapFrom(x => x.stockVacunado))
            //   .ForMember(dest => dest.ActasAnimalesDDJJ, opt => opt.MapFrom(x => x.stockCensado));

            ////CreateMap<ApiActasPendientesDto, ActaDto>()
            ////   .ForMember(dest => dest.Campania, opt => opt.MapFrom(x => x.campaniaCarga))
            ////   .ForMember(dest => dest.ternerasBubalinasBrucelosis, opt => opt.MapFrom(x => x.cantidadBubVacunadosBrucelosis))
            ////   .ForMember(dest => dest.Dosis, opt => opt.MapFrom(x => x.cantidadDosis))
            ////   .ForMember(dest => dest.TernerasBrucelosis, opt => opt.MapFrom(x => x.cantidadVacunadosBrucelosis))
            ////   .ForMember(dest => dest.Total, opt => opt.MapFrom(x => x.esActaTotal))
            ////   .ForMember(dest => dest.Serie, opt => opt.MapFrom(x => x.numeroSerie))
            ////   .ForMember(dest => dest.SerieBrucelosis, opt => opt.MapFrom(x => x.numeroSerieBrucelosis))
            ////   .ForMember(dest => dest.CuitVacunador, opt => opt.MapFrom(x => x.vacunador));
            ////   //.ForMember(dest => dest.Stock, opt => opt.MapFrom(x => x.stockVacunado))
            ////   //.ForMember(dest => dest.StockDDJJ, opt => opt.MapFrom(x => x.stockCensado));


            ////CreateMap<ApiStockDto, StockDto>()
            ////       .ForMember(dest => dest.cantidad, opt => opt.MapFrom(x => x.cantidad));
            ////       //.ForPath(dest => dest.categoria.id, opt => opt.MapFrom(x => x.codigoCategoria)); No se puede mapear asi ya que no trae el id sino codigo





            //CreateMap<Actas, ActaDto>()
            //    .ForMember(dest => dest.Campania, opt => opt.MapFrom(x => x.CampaniaCarga))
            //    .ForMember(dest => dest.ternerasBubalinasBrucelosis, opt => opt.MapFrom(x => x.CantidadBubVacunadosBrucelosis))
            //    .ForMember(dest => dest.Dosis, opt => opt.MapFrom(x => x.CantidadDosis))
            //    .ForMember(dest => dest.TernerasBrucelosis, opt => opt.MapFrom(x => x.CantidadVacunadosBrucelosis))
            //    .ForMember(dest => dest.Total, opt => opt.MapFrom(x => x.EsActaTotal))
            //    .ForMember(dest => dest.Serie, opt => opt.MapFrom(x => x.NumeroSerie))
            //    .ForMember(dest => dest.SerieBrucelosis, opt => opt.MapFrom(x => x.NumeroSerieBrucelosis))
            //    .ForMember(dest => dest.CuitVacunador, opt => opt.MapFrom(x => x.Vacunador))
            //    .ForMember(dest => dest.Stock, opt => opt.MapFrom(x => x.ActasAnimales))
            //    .ForMember(dest => dest.StockDDJJ, opt => opt.MapFrom(x => x.ActasAnimalesDDJJ));

            //CreateMap<ActaDto, Actas>()
            //    .ForMember(dest => dest.CampaniaCarga, opt => opt.MapFrom(x => x.Campania))
            //    .ForMember(dest => dest.CantidadBubVacunadosBrucelosis, opt => opt.MapFrom(x => x.ternerasBubalinasBrucelosis))
            //    .ForMember(dest => dest.CantidadDosis, opt => opt.MapFrom(x => x.Dosis))
            //    .ForMember(dest => dest.CantidadVacunadosBrucelosis, opt => opt.MapFrom(x => x.TernerasBrucelosis))
            //    .ForMember(dest => dest.EsActaTotal, opt => opt.MapFrom(x => x.Total))
            //    .ForMember(dest => dest.NumeroSerie, opt => opt.MapFrom(x => x.Serie))
            //    .ForMember(dest => dest.NumeroSerieBrucelosis, opt => opt.MapFrom(x => x.SerieBrucelosis))
            //    .ForMember(dest => dest.Vacunador, opt => opt.MapFrom(x => x.CuitVacunador))
            //    .ForMember(dest => dest.ActasAnimales, opt => opt.MapFrom(x => x.Stock))
            //    .ForMember(dest => dest.ActasAnimalesDDJJ, opt => opt.MapFrom(x => x.StockDDJJ));

            //CreateMap<Actas, ActaUpdateDto>()
            //    .ForMember(dest => dest.Stock, opt => opt.MapFrom(x => x.ActasAnimales));

            //CreateMap<ActaUpdateDto, Actas>()
            //     .ForMember(dest => dest.CampaniaCarga, opt => opt.MapFrom(x => x.Campania))
            //    .ForMember(dest => dest.CantidadBubVacunadosBrucelosis, opt => opt.MapFrom(x => x.ternerasBubalinasBrucelosis))
            //    .ForMember(dest => dest.CantidadDosis, opt => opt.MapFrom(x => x.Dosis))
            //    .ForMember(dest => dest.CantidadVacunadosBrucelosis, opt => opt.MapFrom(x => x.TernerasBrucelosis))
            //    .ForMember(dest => dest.EsActaTotal, opt => opt.MapFrom(x => x.Total))
            //    .ForMember(dest => dest.NumeroSerie, opt => opt.MapFrom(x => x.Serie))
            //    .ForMember(dest => dest.NumeroSerieBrucelosis, opt => opt.MapFrom(x => x.SerieBrucelosis))
            //    .ForMember(dest => dest.Vacunador, opt => opt.MapFrom(x => x.CuitVacunador))
            //    .ForMember(dest => dest.ActasAnimales, opt => opt.MapFrom(x => x.Stock))
            //    .ForMember(dest => dest.ActasAnimalesDDJJ, opt => opt.MapFrom(x => x.StockDDJJ));


            //CreateMap<StockDto, ActasAnimales>()
            //        .ForMember(dest => dest.Cantidad, opt => opt.MapFrom(x => x.cantidad))
            //        .ForMember(dest => dest.AnimalesID, opt => opt.MapFrom(x => x.categoria.id));

            //CreateMap<ActasAnimales, StockDto>()
            //        .ForMember(dest => dest.cantidad, opt => opt.MapFrom(x => x.Cantidad))
            //        .ForPath(dest => dest.categoria.id, opt => opt.MapFrom(x => x.AnimalesID));

            //CreateMap<StockDto, ActasAnimalesDDJJ>()
            //        .ForMember(dest => dest.Cantidad, opt => opt.MapFrom(x => x.cantidad))
            //        .ForMember(dest => dest.AnimalesID, opt => opt.MapFrom(x => x.categoria.id));

            //CreateMap<ActasAnimalesDDJJ, StockDto>()
            //    .ForMember(dest => dest.cantidad, opt => opt.MapFrom(x => x.Cantidad))
            //    .ForPath(dest => dest.categoria.id, opt => opt.MapFrom(x => x.AnimalesID));


            //CreateMap<Animales, AnimalesDto>();
            //CreateMap<ApiAnimalesDto, Animales>()
            //        .ForMember(dest => dest.Codigo, opt => opt.MapFrom(x => x.codigo))
            //        .ForMember(dest => dest.EspecieId, opt => opt.MapFrom(x => x.especie.id))
            //        .ForMember(dest => dest.Nombre, opt => opt.MapFrom(x => x.nombre))
            //        .ForMember(dest => dest.Orden, opt => opt.MapFrom(x => x.orden))
            //        .ForMember(dest => dest.UmCodigo, opt => opt.MapFrom(x => x.unidadDeMedida.codigo))
            //        .ForMember(dest => dest.UmId, opt => opt.MapFrom(x => x.unidadDeMedida.id))
            //        .ForMember(dest => dest.UmNombre, opt => opt.MapFrom(x => x.unidadDeMedida.nombre));

            //CreateMap<ApiEspecieDto, Especies>()
            //        .ForMember(dest => dest.Codigo, opt => opt.MapFrom(x => x.codigo))
            //        .ForMember(dest => dest.Id, opt => opt.MapFrom(x => x.id))
            //        .ForMember(dest => dest.Nombre, opt => opt.MapFrom(x => x.nombre));

            //CreateMap<Actas, ApiActasPendientesDto>()
            //    .ForMember(dest => dest.Estado, opt => opt.MapFrom(x => x.NombreEstado))
            //    .ForMember(dest => dest.stockVacunado, opt => opt.MapFrom(x => x.ActasAnimales))
            //    .ForMember(dest => dest.stockCensado, opt => opt.MapFrom(x => x.ActasAnimalesDDJJ));

            //CreateMap<ActasAnimales, ApiStockDto>()
            //        .ForMember(dest => dest.cantidad, opt => opt.MapFrom(x => x.Cantidad))
            //        .ForMember(dest => dest.codigoCategoria, opt => opt.MapFrom(x => x.AnimalesCodigo))
            //        .ForMember(dest => dest.idCategoria, opt => opt.MapFrom(x => x.AnimalesID))
            //        .ForMember(dest => dest.nombreCategoria, opt => opt.MapFrom(x => x.AnimalesNombre));

            //CreateMap<ApiStockDto, ActasAnimales>()
            //       .ForMember(dest => dest.Cantidad, opt => opt.MapFrom(x => x.cantidad))
            //       .ForMember(dest => dest.AnimalesCodigo, opt => opt.MapFrom(x => x.codigoCategoria))
            //       .ForMember(dest => dest.AnimalesNombre, opt => opt.MapFrom(x => x.nombreCategoria));

            //CreateMap<ActasAnimalesDDJJ, ApiStockDto>()
            //        .ForMember(dest => dest.cantidad, opt => opt.MapFrom(x => x.Cantidad))
            //        .ForMember(dest => dest.codigoCategoria, opt => opt.MapFrom(x => x.AnimalesCodigo))
            //        .ForMember(dest => dest.idCategoria, opt => opt.MapFrom(x => x.AnimalesID))
            //        .ForMember(dest => dest.nombreCategoria, opt => opt.MapFrom(x => x.AnimalesNombre));

            //CreateMap<ApiStockDto, ActasAnimalesDDJJ>()
            //       .ForMember(dest => dest.Cantidad, opt => opt.MapFrom(x => x.cantidad))
            //       .ForMember(dest => dest.AnimalesCodigo, opt => opt.MapFrom(x => x.codigoCategoria))
            //       .ForMember(dest => dest.AnimalesNombre, opt => opt.MapFrom(x => x.nombreCategoria));

            //CreateMap<ActasAnimales, StockContent>()
            //       .ForMember(dest => dest.cantidad, opt => opt.MapFrom(x => x.Cantidad))
            //       .ForPath(dest => dest.categoria.id, opt => opt.MapFrom(x => x.AnimalesID));

            //CreateMap<ActasAnimalesDDJJ, StockContent>()
            //       .ForMember(dest => dest.cantidad, opt => opt.MapFrom(x => x.Cantidad))
            //       .ForPath(dest => dest.categoria.id, opt => opt.MapFrom(x => x.AnimalesID));

            //CreateMap<Actas,GuardarActaContent>()
            //    .ForMember(dest => dest.fechaVacunacion, opt => opt.MapFrom(x =>x.FechaVacunacion != null? String.Format("{0:dd/MM/yyyy}",x.FechaVacunacion):String.Empty))
            //    .ForMember(dest => dest.campania, opt => opt.MapFrom(x => x.CampaniaCarga))
            //    .ForMember(dest => dest.ternerasBubalinasBrucelosis, opt => opt.MapFrom(x => x.CantidadBubVacunadosBrucelosis))
            //    .ForMember(dest => dest.dosis, opt => opt.MapFrom(x => x.CantidadDosis))
            //    .ForMember(dest => dest.ternerasBrucelosis, opt => opt.MapFrom(x => x.CantidadVacunadosBrucelosis))
            //    .ForMember(dest => dest.total, opt => opt.MapFrom(x => x.EsActaTotal))
            //    .ForMember(dest => dest.serie, opt => opt.MapFrom(x => x.NumeroSerie))
            //    .ForMember(dest => dest.serieBrucelosis, opt => opt.MapFrom(x => x.NumeroSerieBrucelosis))
            //    .ForMember(dest => dest.cuitVacunador, opt => opt.MapFrom(x => x.Vacunador))
            //    .ForMember(dest => dest.stock, opt => opt.MapFrom(x => x.ActasAnimales))
            //    .ForMember(dest => dest.stockDDJJ, opt => opt.MapFrom(x => x.ActasAnimalesDDJJ));

            //CreateMap<ApiVacunasDto, Vacunas>();
            //CreateMap<Vacunas, ApiVacunasDto>();

            //CreateMap<VacunasStock, VacunaStockDto>();
            //CreateMap<VacunaStockDto, VacunasStock>();

            //CreateMap<VacunasStock, VacunasStockDtoOut>()
            //    .ForMember(dest => dest.Heladera, opt => opt.MapFrom(x => x.Heladera != null ? x.Heladera.Nombre : string.Empty))
            //    .ForMember(dest => dest.Subcentro, opt => opt.MapFrom(x => x.Subcentro != null ? x.Subcentro.Nombre : string.Empty))
            //    .ForMember(dest => dest.MarcaVacuna, opt => opt.MapFrom(x =>x.Vacunas != null? x.Vacunas.Marca:string.Empty))
            //    .ForMember(dest => dest.DescripcionVacuna, opt => opt.MapFrom(x => x.Vacunas != null ? x.Vacunas.Descripcion : string.Empty));
            //CreateMap<VacunasStockDtoOut, VacunasStock>();

            //CreateMap<VacunasStock, VacunaStockUpdateDto>();
            //CreateMap<VacunaStockUpdateDto, VacunasStock>();

            //CreateMap<EntregaRecepcionVacunaDto, TurnosVacunas>();
            //CreateMap<TurnosVacunas, EntregaRecepcionVacunaDto>();

            //CreateMap<TurnosVacunasDtoOut, TurnosVacunas>();
            //CreateMap<TurnosVacunas, TurnosVacunasDtoOut>();

            //CreateMap<Vacunas, VacunaDto>();
            //CreateMap<VacunaDto, Vacunas>();

            CreateMap<Stock, StockDto>();
            

        }
    }
}
