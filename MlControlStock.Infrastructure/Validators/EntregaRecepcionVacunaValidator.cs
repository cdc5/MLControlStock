using FluentValidation;
using FundaGes.Core.DTOs;


namespace FundaGes.Infrastructure.Validators
{
    public class EntregaRecepcionVacunaValidator : AbstractValidator<EntregaRecepcionVacunaDto>
    {
        public EntregaRecepcionVacunaValidator()
        {
            RuleFor(e => e.VacunasStockId).NotNull();
            RuleFor(e => e.EsEntrega).NotNull();
            
            RuleFor(e => e.CantidadEntregada).NotNull().When(e => e.EsEntrega == true);
            RuleFor(e => e.FechaEntrega).NotNull().When(e => e.EsEntrega == true);
            RuleFor(e => e.CantidadEntregada).NotNull().When(e => e.FechaEntrega != null);
            RuleFor(e => e.FechaEntrega).NotNull().When(e => e.CantidadEntregada != null);

            RuleFor(e => e.CantidadDevolucion).Null().When(e => e.EsEntrega == true);
            RuleFor(e => e.FechaDevolucion).Null().When(e => e.EsEntrega == true);
            RuleFor(e => e.TemperaturaDevolucion).Null().When(e => e.EsEntrega == true);

            RuleFor(e => e.CantidadDevolucion).NotEmpty().When(e => e.EsEntrega == false);
            RuleFor(e => e.FechaDevolucion).NotEmpty().When(e => e.EsEntrega == false);
            RuleFor(e => e.CantidadDevolucion).NotNull().When(e => e.FechaDevolucion != null);
            RuleFor(e => e.FechaDevolucion).NotNull().When(e => e.CantidadDevolucion != null);


            RuleFor(e => e.CantidadEntregada).Null().When(e => e.EsEntrega == false);
            RuleFor(e => e.FechaEntrega).Null().When(e => e.EsEntrega == false);
            RuleFor(e => e.TemperaturaSalida).Null().When(e => e.EsEntrega == false);
        }
    }
}
