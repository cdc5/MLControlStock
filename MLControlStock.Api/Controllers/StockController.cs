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
        //private readonly IActaService _actaService;
        //private readonly IMapper _mapper;

        //public ActaController(IActaService actaService, IMapper mapper)
        //{
        //    _actaService = actaService;
        //    _mapper = mapper;
        //}

        //[HttpGet]
        //public async Task<IActionResult> GetActas([FromQuery]ActaQueryFilter filters)
        //{
        //    var Actas = await _actaService.GetActasDto(filters,User);
        //    //var TurnosDto = _mapper.Map<IEnumerable<TurnosDto>>(Turnos);
        //    var response = new ApiResponse<IEnumerable<ActaDto>>(Actas);
        //    return Ok(response);
        //}

        ////[HttpGet]
        ////public async Task<IActionResult> GetActasPendientes([FromQuery] ActaQueryFilter filters)
        ////{

        ////    var Actas = await _actaService.GetActasPendientes(User);
        ////    //var TurnosDto = _mapper.Map<IEnumerable<TurnosDto>>(Turnos);
        ////    var response = new ApiResponse<IEnumerable<Actas>>(Actas);
        ////    return Ok(response);
        ////}

        //[HttpGet("GetActasSenasa")]
        //public async Task<IActionResult> GetActasSenasa([FromQuery] string campania)
        //{
        //    var Actas = await _actaService.GetActasSenasa(campania, User);
        //    var response = new ApiResponse<IEnumerable<ApiActasDto>>(Actas);
        //    return Ok(response);
        //}

        //[HttpGet("GetActaSenasa")]
        //public async Task<IActionResult> GetActaSenasa([FromQuery] string campania, [FromQuery] string codigo)
        //{
        //    var Actas = await _actaService.GetActaSenasa(campania, codigo, User);
        //    var response = new ApiResponse<IEnumerable<ApiActasPendientesDto>>(Actas);
        //    return Ok(response);
        //}

        //[HttpGet("GetActasPendientesSenasa")]
        //public async Task<IActionResult> GetActasPendientesSenasa([FromQuery] string campania)
        //{
        //    var Actas = await _actaService.GetActasPendientesSenasa(campania,User);
        //    var response = new ApiResponse<IEnumerable<ApiActasPendientesDto>>(Actas);
        //    return Ok(response);
        //}

        //[HttpGet("GetActasPendientesFundacion")]
        //public async Task<IActionResult> GetActasPendientesFundacion([FromQuery] string campania)
        //{

        //    var Actas = await _actaService.GetActasPendientesFundacion(campania, User);
        //    var response = new ApiResponse<IEnumerable<ApiActasPendientesDto>>(Actas);
        //    return Ok(response);
        //}

        //[HttpGet("GetActasPendientes")]
        //public async Task<IActionResult> GetActasPendientes([FromQuery] string campania)
        //{

        //    var Actas = await _actaService.GetActasPendientes(campania, User);
        //    var response = new ApiResponse<IEnumerable<ApiActasPendientesDto>>(Actas);
        //    return Ok(response);
        //}

        //[HttpGet("{id}")]
        //public async Task<IActionResult> Get(int id)
        //{
        //    var Acta = await _actaService.GetActa(id,User);
        //    var response = new ApiResponse<Actas>(Acta);
        //    return Ok(response);
        //}

        //[HttpPost]
        //public async Task<IActionResult> Post(ActaDto ActaDto)
        //{
        //    await _actaService.InsertActaDto(ActaDto,Parametros.PendienteEnFundacion.Id,User);
        //    var response = new ApiResponse<ActaDto>(ActaDto);
        //    return Ok(response);
        //}

        //[HttpPut]
        //public async Task<IActionResult> Put( ActaUpdateDto ActaDto)
        //{
        //    var result = await _actaService.UpdateActa(ActaDto,User);
        //    var response = new ApiResponse<bool>(result);
        //    return Ok(response);
        //}

        //[HttpPut("UpdateActaID")]
        //public async Task<IActionResult> UpdateActaID([FromQuery] string codigo, [FromQuery] int id)
        //{
        //    var result = await _actaService.UpdateActaID(codigo, id, User);
        //    var response = new ApiResponse<bool>(result);
        //    return Ok(response);
        //}

        ////[HttpPatch]
        ////public async Task<IActionResult> Patch(long id, ActaEstadoDto ActaEstadoDto)
        ////{
        ////    var result = await _actaService.CambiarEstadoActa(id, ActaEstadoDto,User);
        ////    var response = new ApiResponse<long>(result);
        ////    return Ok(response);
        ////}

        //[HttpPatch("CambiarEstadoActaFundacion")]
        //public async Task<IActionResult> CambiarEstadoActaFundacion(string codigo, ActaEstadoDto ActaEstadoDto)
        //{
        //    var result = await _actaService.CambiarEstadoActaFundacion(codigo, ActaEstadoDto, User);
        //    var response = new ApiResponse<long>(result);
        //    return Ok(response);
        //}

        //[HttpPatch("CambiarEstadoActaSenasa")]
        //public async Task<IActionResult> CambiarEstadoActaSenasa(long id,string codigo, string campania, string Estado)
        //{
        //    var result = await _actaService.CambiarEstadoActaSenasa(id,codigo,campania,Estado,User);
        //    var response = new ApiResponse<long?>(result);
        //    return Ok(response);
        //}

        //[HttpDelete]
        //public async Task<IActionResult> Delete(string codigo)
        //{
        //    var result = await _actaService.DeleteActa(codigo, User);
        //    var response = new ApiResponse<bool>(result);
        //    return Ok(response);
        //}
    }
}
