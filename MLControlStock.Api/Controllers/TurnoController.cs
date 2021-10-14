using AutoMapper;
using FundaGes.Api.Responses;
using FundaGes.Core.DTOs;
using FundaGes.Core.Interfaces;
using FundaGes.Core.QueryFilters;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;

namespace FundaGes.Api.Controllers
{
    [Authorize]
    [Produces("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("FundaGes_Policy")]
    public class TurnoController : ControllerBase
    {
        private readonly ITurnoService _turnoService;
        private readonly IMapper _mapper;

        public TurnoController(ITurnoService turnoService,IMapper mapper)
        {
            _turnoService = turnoService;
            _mapper = mapper;
        }

        /// <summary>
        /// Regresa todos los turnos
        /// </summary>
        /// <param name="filters">CuitFundacion,CuitVacunador</param>
        /// <returns></returns>
        [HttpGet]
        [EnableCors("FundaGes_Policy")]
        [ProducesResponseType((int)HttpStatusCode.OK,Type = typeof(IEnumerable<TurnosDtoOut>))]
        [ProducesResponseType((int)HttpStatusCode.BadRequest)]
        public async Task<IActionResult> GetTurnos([FromQuery]TurnoQueryFilter filters)
        {
            var Turnos = _turnoService.GetTurnosDto(filters);            
            var response = new ApiResponse<IEnumerable<TurnosDtoOut>>(Turnos);            
            return Ok(response);               
        }

        [HttpGet("{id}")]
        [EnableCors("FundaGes_Policy")]
        public async Task<IActionResult> GetTurno(int id)
        {
            var Turnos = await _turnoService.GetTurno(id);
            var TurnoDto = _mapper.Map<TurnosDtoOut>(Turnos);
            var response = new ApiResponse<TurnosDtoOut>(TurnoDto);
            return Ok(response);
        }

        [HttpPost]
        [EnableCors("FundaGes_Policy")]
        public async Task<IActionResult> Post(TurnosDto turnoDto)
        {
            await _turnoService.InsertTurno(turnoDto);
            var turnoDtoOut = _mapper.Map<TurnosDtoOut>(turnoDto);//modificar despues por el turno realmente agregado.
            var response = new ApiResponse<TurnosDtoOut>(turnoDtoOut);
            return Ok(response);
        }

        [HttpPut]
        [EnableCors("FundaGes_Policy")]
        public async Task<IActionResult> Put(int id,TurnosUpdateDto turnoDto)
        {
           var result =  await _turnoService.UpdateTurno(id, turnoDto);
            var response = new ApiResponse<bool>(result);
            return Ok(response);
        }

        [HttpDelete]
        [EnableCors("FundaGes_Policy")]
        public async Task<IActionResult> Delete(int id)
        {
            var result = await _turnoService.DeleteTurno(id);
            var response = new ApiResponse<bool>(result);
            return Ok(response);
        }

    }
}
