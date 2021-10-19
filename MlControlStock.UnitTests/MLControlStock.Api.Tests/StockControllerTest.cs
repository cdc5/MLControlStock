using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using MLControlStock.Api.Controllers;
using MLControlStock.Api.Responses;
using MLControlStock.Core.DTOs;
using MLControlStock.Core.Entities;
using MLControlStock.Core.Exceptions;
using MLControlStock.Core.Interfaces;
using MLControlStock.Core.Services;
using MLControlStock.Infrastructure.Data;
using MLControlStock.Infrastructure.Mappings;
using MLControlStock.Infrastructure.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xunit;


namespace MlControlStock.UnitTests.MLControlStock.Api.Tests
{
    public class StockControllerTest 
    {
        private readonly IMapper _mapper;
        private readonly IStockService _stockService;
        private readonly StockController _controller;

        public StockControllerTest()
        {
            ApiClientMock ApiClientMock = new ApiClientMock();
            IUnitOfWork iow = new UnitOfWorkMock();
            var mapperconfig = new MapperConfiguration(cfg => {
                cfg.AddProfile<AutoMapperProfile>();
            });
            _mapper = new Mapper(mapperconfig);
            _stockService = new StockService(iow,_mapper, ApiClientMock);
            _controller = new StockController(_stockService,_mapper);
        }

        //Get

        [Fact]
        public async Task Get_AlInvocar_RetornaOkResultAsync()
        {
            //Arrange
            string deposito = "AR01";
            string ubicacion = "LM-00-00-IZ";
            // Act
            var okResult = await _controller.Get(deposito, ubicacion);
            // Assert
            Assert.IsType<OkObjectResult>(okResult as OkObjectResult);
        }

        [Theory]
        [InlineData("AR01","LM-00-00-IZ",3)] 
        [InlineData("AR01","LM-04-02-IZ", 1)]
        public async Task Get_AlInvocar_RetornaTodosLosProductosDeUbicacion(string deposito, string ubicacion, int expected)
        {
            var okResult = await _controller.Get(deposito, ubicacion) as OkObjectResult;
            var items = Assert.IsType<ApiResponse<IEnumerable<StockDto>>>(okResult.Value);
            var lista = (List<StockDto>)items.Data;
            
            Assert.Equal(expected, lista.Count);            
        }

        [Theory]
        //Deposito inexistente
        [InlineData("ZZ01", "LM-00-00-IZ",0)]
        public async Task Get_AlInvocar_RetornaListaVacia(string deposito, string ubicacion, int expected)
        {
            var okResult = await _controller.Get(deposito, ubicacion) as OkObjectResult;
            var items = Assert.IsType<ApiResponse<IEnumerable<StockDto>>>(okResult.Value);
            var lista = (List<StockDto>)items.Data;
            
            Assert.Equal(expected, lista.Count);
        }

        [Theory]
        
        [InlineData("AR01", "LM-04-02-IZ", "MLA813727183")]
        public async Task Get_AlInvocar_RetornaElProductoCorrecto(string deposito, string ubicacion, string expected)
        {
            var okResult = await _controller.Get(deposito, ubicacion) as OkObjectResult;
            var items = Assert.IsType<ApiResponse<IEnumerable<StockDto>>>(okResult.Value);
            var lista = (List<StockDto>)items.Data;
            var producto = lista.First();
            
            Assert.Equal(expected, producto.productId);
        }

        //GetPorProducto
        [Fact]       
        public async Task GetPorProducto_AlInvocar_RetornaLasUbicacionesCorrectas()
        {
            string deposito = "AR01";
            string producto = "MLA813727183";
            int cantidadTotal = 89;
            string ubicacion1 = "LM-00-00-IZ";
            string ubicacion2 = "LM-04-02-IZ";
            string ubicacion3 = "LM-01-01-DE";


            var okResult = await _controller.GetPorProducto(deposito, producto) as OkObjectResult;
            var items = Assert.IsType<ApiResponse<IEnumerable<StockPorProductoDto>>>(okResult.Value);
            var lista = (List<StockPorProductoDto>)items.Data;            
            
            Assert.Equal(3, lista.Count());
            Assert.Equal(lista.Sum(x=>x.cantidad),cantidadTotal);

            List<string> ubicaciones = lista.Select(x => x.ubicacion).ToList();
            Assert.Contains(ubicacion1, ubicaciones);
            Assert.Contains(ubicacion2, ubicaciones);
            Assert.Contains(ubicacion3, ubicaciones);           

        }
        //SE decide testear los controladores directamente y no unidades funcionales mas pequeñas para realizar una muestra 
        //general del testeo del proyecto completo.

        //Post
        //Formatos incorrectos de ubicacion
        [Theory]
        [InlineData("AR01", "LMA-04-02-IZ", "MLA813727183", 40)]
        [InlineData("AR01", "LM-0-02-IZ", "MLA813727183", 40)]
        [InlineData("AR01", "LM-04-#2-IZ", "MLA813727183", 40)]
        [InlineData("AR01", "LM-04-02-AA", "MLA813727183", 40)]
        [InlineData("AR01", "LM-AS-02-IZ", "MLA813727183", 40)]
        [InlineData("AR01", "LM-ASA-02-IZ", "MLA813727183", 40)]
        [InlineData("AR01", "LM-AS-2-IZ", "MLA813727183", 40)]
        [InlineData("AR01", "LM-AS-12302-IZ", "MLA813727183", 40)]
        [InlineData("AR01", "LM-AS-02-LAX", "MLA813727183", 40)]
       
        public async Task Post_ParametroUbicacionInvalido_RetornaExcepcionDeNegocio(string deposito, string ubicacion, string producto, int cantidad)
        {            
            await Assert.ThrowsAsync<BusinessException>(() => _controller.Post(deposito, ubicacion, producto, cantidad));
        }
        
        
        [Theory]
        [InlineData("AR01", "LM-04-02-IZ", "MLA813727190", 40)]
        public async Task Post_ProductoNoEnDeposito_RetornaExcepcionDeNegocio(string deposito, string ubicacion, string producto, int cantidad)
        {
            await Assert.ThrowsAsync<BusinessException>(() => _controller.Post(deposito, ubicacion, producto, cantidad));
        }

        //Validar Lugar Disponible En Ubicacion
        [Fact]
        public async Task Post_ValidarLugarDisponibleEnUbicacionNoMasDeTresItems_RetornaExcepcionDeNegocio()
        {
            string deposito = "AR01";
            string producto = "MLA813727186";
            string ubicacion = "LM-00-00-IZ";
            int cantidad = 1;

            await Assert.ThrowsAsync<BusinessException>(() => _controller.Post(deposito, ubicacion, producto, cantidad));
        }

        [Fact]
        public async Task Post_ValidarLugarDisponibleEnUbicacionNoMasDe100Productos_RetornaExcepcionDeNegocio()
        {
            string deposito = "AR01";
            string producto = "MLA813727183";
            string ubicacion = "LM-00-00-IZ";
            int cantidad = 101;

            await Assert.ThrowsAsync<BusinessException>(() => _controller.Post(deposito, ubicacion, producto, cantidad));
        }

        //Se realizan mas de una comprobación(Assert) por metodo de testing debido a que todas la comprobaciones
        //corresponden a una misma unidad de testeo y tienen sentido lógico.
        [Fact]
        public async Task Post_AgregarStock_RetornaStockCreado()
        {
            string deposito = "AR01";
            string producto = "MLA813727186";
            string ubicacion = "AL-00-00-DE";
            int cantidad = 20;

            var OkObjectResult = await _controller.Post(deposito, ubicacion, producto, cantidad) as OkObjectResult;
            var Response = Assert.IsType<ApiResponse<Stock>>(OkObjectResult.Value);
            //var ListRespose = (List<Stock>)Response.Data;
            var stockCreado = Response.Data;
            Ubicacion ubi = new Ubicacion(ubicacion);
            
            Assert.IsType<Stock>(stockCreado);
            Assert.Equal(stockCreado.Deposito, deposito);
            Assert.Equal(stockCreado.Area, ubi.Area);
            Assert.Equal(stockCreado.Pasillo, ubi.Pasillo);
            Assert.Equal(stockCreado.Fila, ubi.Fila);
            Assert.Equal(stockCreado.Cara, ubi.Cara);
            Assert.Equal(stockCreado.ProductId, producto);         

        }

        [Fact]
        public async Task Post_AgregarStockAElementoExistente_RetornaStockCreado()
        {
            string deposito = "AR01";
            string producto = "MLA813727184";
            string ubicacion = "AL-00-00-DE";
            int cantidad = 1;
            int cantidadTotal = 22;

            var OkObjectResult = await _controller.Post(deposito, ubicacion, producto, cantidad) as OkObjectResult;
            var Response = Assert.IsType<ApiResponse<Stock>>(OkObjectResult.Value);
            //var ListRespose = (List<Stock>)Response.Data;
            var stockCreado = Response.Data;
            Ubicacion ubi = new Ubicacion(ubicacion);

            Assert.IsType<Stock>(stockCreado);
            Assert.Equal(stockCreado.Deposito, deposito);
            Assert.Equal(stockCreado.Area, ubi.Area);
            Assert.Equal(stockCreado.Pasillo, ubi.Pasillo);
            Assert.Equal(stockCreado.Fila, ubi.Fila);
            Assert.Equal(stockCreado.Cara, ubi.Cara);
            Assert.Equal(stockCreado.ProductId, producto);
            Assert.Equal(stockCreado.Cantidad, cantidadTotal);
        }

        [Fact]
        public async Task Delete_RetirarProductoNoSeEncuentraEnUbicacion_RetornaExcepcionDeNegocio()
        {
            string deposito = "AR01";
            string producto = "MLA813727190";
            string ubicacion = "AL-00-00-DE";
            int cantidad = 20;
            
            await Assert.ThrowsAsync<BusinessException>(() => _controller.Delete(deposito, ubicacion, producto, cantidad));           
        }

        [Fact]
        public async Task Delete_RetirarProductoCantidadMayorAExistente_RetornaExcepcionDeNegocio()
        {
            string deposito = "AR01";
            string producto = "MLA813727184";
            string ubicacion = "AL-00-00-DE";
            int cantidad = 25;

            await Assert.ThrowsAsync<BusinessException>(() => _controller.Delete(deposito, ubicacion, producto, cantidad));
        }

        [Fact]
        public async Task Delete_RetirarCantidadAElementoExistente_RetornaStockExistenteCantidadDisminuida()
        {
            string deposito = "AR01";
            string producto = "MLA813727184";
            string ubicacion = "AL-00-00-DE";
            int cantidad = 11;
            int cantidadTotal = 10;

            var OkObjectResult = await _controller.Delete(deposito, ubicacion, producto, cantidad) as OkObjectResult;
            var Response = Assert.IsType<ApiResponse<Stock>>(OkObjectResult.Value);
            var stockEliminado = Response.Data;
            Ubicacion ubi = new Ubicacion(ubicacion);

            Assert.IsType<Stock>(stockEliminado);
            Assert.Equal(stockEliminado.Deposito, deposito);
            Assert.Equal(stockEliminado.Area, ubi.Area);
            Assert.Equal(stockEliminado.Pasillo, ubi.Pasillo);
            Assert.Equal(stockEliminado.Fila, ubi.Fila);
            Assert.Equal(stockEliminado.Cara, ubi.Cara);
            Assert.Equal(stockEliminado.ProductId, producto);
            Assert.Equal(stockEliminado.Cantidad, cantidadTotal);
        }

        [Fact]
        public async Task Delete_RetirarCantidadAElementoExistente_RetornaStockExistenteCantidadEnCero()
        {
            string deposito = "AR01";
            string producto = "MLA813727184";
            string ubicacion = "AL-00-00-DE";
            int cantidad = 21;
            int cantidadTotal = 0;

            var OkObjectResult = await _controller.Delete(deposito, ubicacion, producto, cantidad) as OkObjectResult;
            var Response = Assert.IsType<ApiResponse<Stock>>(OkObjectResult.Value);
            var stockEliminado = Response.Data;
            Ubicacion ubi = new Ubicacion(ubicacion);

            Assert.IsType<Stock>(stockEliminado);
            Assert.Equal(stockEliminado.Deposito, deposito);
            Assert.Equal(stockEliminado.Area, ubi.Area);
            Assert.Equal(stockEliminado.Pasillo, ubi.Pasillo);
            Assert.Equal(stockEliminado.Fila, ubi.Fila);
            Assert.Equal(stockEliminado.Cara, ubi.Cara);
            Assert.Equal(stockEliminado.ProductId, producto);
            Assert.Equal(stockEliminado.Cantidad, cantidadTotal);
        }

    }
}
