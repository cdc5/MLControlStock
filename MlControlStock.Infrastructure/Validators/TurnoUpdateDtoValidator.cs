using FluentValidation;
using FundaGes.Core.DTOs;


namespace FundaGes.Infrastructure.Validators
{
    public class TurnoUpdateDtoValidator : AbstractValidator<TurnosUpdateDto>
    {
        public TurnoUpdateDtoValidator()
        {
            RuleFor(m => m.nombreVacunador).NotEmpty().When(m => !string.IsNullOrEmpty(m.cuitVacunador));
            RuleFor(m => m.cuitVacunador).NotEmpty().When(m => !string.IsNullOrEmpty(m.nombreVacunador));
        }
    }
}
