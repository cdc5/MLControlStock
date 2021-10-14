using FundaGes.Core.Entities;
using System;
using System.Threading.Tasks;

namespace FundaGes.Core.Interfaces
{
    public interface IUnitOfWork:IDisposable
    {
        //Aca se agregan todos los repositorios que se quieren usar en la unit of work
        //Para nuestra aplicacion todos.
        ITurnoRepository TurnoRepository { get;}
        IRepository<Actas> ActaRepository { get; }
        IUsuarioRepository UsuarioRepository { get; }
        IFundacionRepository FundacionRepository { get; }
        IVacunadorRepository VacunadorRepository { get; }
        IMiembroFundacionRepository MiembroFundacionRepository { get; }
        IRepository<Establecimiento> EstablecimientoRepository { get; }
        IRepository<Renspas> RenspaRepository { get; }
        IRepository<TurnosRenspas> TurnosRenspasRepository { get; }
        IRepository<Heladeras> HeladeraRepository { get; }
        IRepository<Subcentros> SubCentroRepository { get; }
        IRepository<Animales> AnimalesRepository { get; }
        IRepository<Especies> EspeciesRepository { get; }
        IRepository<Vacunas> VacunasRepository { get; }
        IRepository<VacunasStock> VacunasStockRepository { get; }
        IRepository<TurnosVacunas> TurnosVacunasRepository { get; }

        void SaveChanges();
        Task SaveChangesAsync();
    }
}
