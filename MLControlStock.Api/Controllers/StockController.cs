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

namespace FundaGes.Api.Controllers
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
            return Ok(stock);
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromQuery] string deposito, [FromQuery] string ubicacion, [FromQuery] string producto, [FromQuery] int cantidad)
        {
            var stock = await _stockService.AgregarProducto(deposito,ubicacion,producto,cantidad);
            return Ok(stock);
        }

        [HttpDelete]
        public async Task<IActionResult> Delete([FromQuery] string deposito, [FromQuery] string ubicacion, [FromQuery] string producto, [FromQuery] int cantidad)
        {
            var result = await _stockService.RetirarProducto(deposito, ubicacion, producto, cantidad);
            return Ok(result);
        }


    }
}
