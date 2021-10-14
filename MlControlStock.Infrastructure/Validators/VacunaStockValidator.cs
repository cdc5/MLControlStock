using FluentValidation;
using FundaGes.Core.DTOs;

namespace FundaGes.Infrastructure.Validators
{
    class VacunaStockValidator : AbstractValidator<VacunaStockDto>
    {
        public VacunaStockValidator()
        {
            RuleFor(turno => turno.VacunasId)
                .NotNull();
            RuleFor(turno => turno.HeladeraId)
                 .NotNull();
            RuleFor(turno => turno.Cantidad)
                .NotNull();
            RuleFor(turno => turno.Partida)
                .NotNull();            
        }
    }
}
