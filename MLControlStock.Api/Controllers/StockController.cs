using AutoMapper;
using MLControlStock.Api.Responses;
using MLControlStock.Core.ApiClient.Dtos;
using MLControlStock.Core.DTOs;
using MLControlStock.Core.Entities;
using MLControlStock.Core.Interfaces;
using MLControlStock.Core.QueryFilters;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;

namespace MLControlStock.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]    
    public class StockController : ControllerBase
    {
        private readonly IStockService _stockService;
        private readonly IMapper _mapper;

        public StockController(IStockService stockService, IMapper mapper)
        {
            _stockService = stockService;
            _mapper = mapper;
        }

        [HttpGet]
        public async Task<IActionResult> Get([FromQuery] string deposito, [FromQuery] string ubicacion)
        {
            var stock = _stockService.GetStock(deposito,ubicacion);
            var response = new ApiResponse<IEnumerable<StockDto>>(stock);
            return Ok(response);
        }

        [HttpGet("{deposito}/{producto}")]
        public async Task<IActionResult> GetStockPorProducto(string deposito, string producto)
        {
            IEnumerable<StockPorProductoDto> stock = new List<StockPorProductoDto>();
            stock = _stockService.GetStockPorProducto(deposito, producto);
            var response = new ApiResponse<IEnumerable<StockPorProductoDto>>(stock);
            return Ok(response);
        }
        
        //Endpoint GetPorProducto_SP: Realiza la misma función que el endpoint GetPorProducto, pero su implementación
        //esta hecha mediante llamado a Stored Procedure en la Base de Datos, realizado para mostrar otra alternativa a 
        //la utilizada en todo el proyecto (ORM Entity Framework con Linq)
        [HttpGet("GetStockPorProductoSP")]
        public async Task<IActionResult> GetStockPorProductoSP(string deposito, string producto)
        {
            var stock = await _stockService.GetStockPorProductoSP(deposito, producto);
            var response = new ApiResponse<IEnumerable<StockPorProductoDto>>(stock);
            return Ok(response);
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromQuery] string deposito, [FromQuery] string ubicacion, [FromQuery] string producto, [FromQuery] int cantidad)
        {
            var stock = await _stockService.AgregarProducto(deposito,ubicacion,producto,cantidad);
            var response = new ApiResponse<Stock>(stock);
            return Ok(response);
        }

        [HttpDelete]
        public async Task<IActionResult> Delete([FromQuery] string deposito, [FromQuery] string ubicacion, [FromQuery] string producto, [FromQuery] int cantidad)
        {
            var result = await _stockService.RetirarProducto(deposito, ubicacion, producto, cantidad);
            var response = new ApiResponse<Stock>(result);
            return Ok(response);
        }


    }
}
