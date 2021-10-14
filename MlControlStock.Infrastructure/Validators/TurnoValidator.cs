using FluentValidation;
using FundaGes.Core.DTOs;

namespace FundaGes.Infrastructure.Validators
{
    public class TurnoValidator : AbstractValidator<TurnosDto>
    {
        public TurnoValidator()
        {
            RuleFor(turno => turno.FechaTurnoVacunacion)
                .NotNull();
           RuleFor(turno => turno.HoraTurnoVacunacion)
                .NotNull();
            RuleFor(turno => turno.CantAftosa)
                .NotNull();
            RuleFor(turno => turno.CantBruselosis)
                .NotNull();
            RuleFor(turno => turno.EstablecimientoId)
                .NotNull();

            RuleFor(m => m.VacunadorNombre).NotEmpty().When(m => !string.IsNullOrEmpty(m.VacunadorCuit));
            RuleFor(m => m.VacunadorCuit).NotEmpty().When(m => !string.IsNullOrEmpty(m.VacunadorNombre));
        }
    }
}
