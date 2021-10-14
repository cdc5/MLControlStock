using FundaGes.Core.Entities;
using FundaGes.Core.Interfaces;
using FundaGes.Infrastructure.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace FundaGes.Infrastructure.Repositories
{
    public class UnitOfWork:IUnitOfWork
    {
        private readonly FundaGesContext _context;
        private readonly ITurnoRepository _turnoRepository;
        private readonly IRepository<Actas> _actaRepository;
        private readonly IUsuarioRepository _usuarioRepository;
        private readonly IVacunadorRepository _VacunadorRepository;
        private readonly IMiembroFundacionRepository _MiembroFundacionRepositoryRepository;
        private readonly IFundacionRepository _FundacionRepository;
        private readonly IRepository<Establecimiento> _EstablecimientoRepository;
        private readonly IRepository<Renspas> _RenspaRepository;
        private readonly IRepository<TurnosRenspas> _TurnosRenspasRepository;
        private readonly IRepository<Heladeras> _HeladeraRepository;
        private readonly IRepository<Subcentros> _SubcentroRepository;
        private readonly IRepository<Animales> _AnimalesRepository;
        private readonly IRepository<Especies> _EspeciesRepository;
        private readonly IRepository<Vacunas> _VacunasRepository;
        private readonly IRepository<VacunasStock> _VacunasStockRepository;
        private readonly IRepository<TurnosVacunas> _TurnosVacunasRepository;

        public UnitOfWork(FundaGesContext context)
        {
            _context = context;
        }

        public ITurnoRepository TurnoRepository => _turnoRepository ?? new TurnoRepository(_context);
        public IRepository<Actas> ActaRepository => _actaRepository ?? new Repository<Actas>(_context);
        public IUsuarioRepository UsuarioRepository => _usuarioRepository ?? new UsuarioRepository(_context);
        public IVacunadorRepository VacunadorRepository => _VacunadorRepository ?? new VacunadorRepository(_context);
        public IMiembroFundacionRepository MiembroFundacionRepository => _MiembroFundacionRepositoryRepository ?? new MiembroFundacionRepository(_context);
        public IFundacionRepository FundacionRepository => _FundacionRepository ?? new FundacionRepository(_context);
        public IRepository<Establecimiento> EstablecimientoRepository => _EstablecimientoRepository ?? new Repository<Establecimiento>(_context);
        public IRepository<Renspas> RenspaRepository => _RenspaRepository ?? new Repository<Renspas>(_context);
        public IRepository<TurnosRenspas> TurnosRenspasRepository => _TurnosRenspasRepository ?? new Repository<TurnosRenspas>(_context);
        public IRepository<Heladeras> HeladeraRepository => _HeladeraRepository ?? new Repository<Heladeras>(_context);
        public IRepository<Subcentros> SubCentroRepository => _SubcentroRepository ?? new Repository<Subcentros>(_context);
        public IRepository<Animales> AnimalesRepository => _AnimalesRepository ?? new Repository<Animales>(_context);
        public IRepository<Especies> EspeciesRepository => _EspeciesRepository ?? new Repository<Especies>(_context);
        public IRepository<Vacunas> VacunasRepository => _VacunasRepository ?? new Repository<Vacunas>(_context);
        public IRepository<VacunasStock> VacunasStockRepository => _VacunasStockRepository ?? new Repository<VacunasStock>(_context);
        public IRepository<TurnosVacunas> TurnosVacunasRepository => _TurnosVacunasRepository ?? new Repository<TurnosVacunas>(_context);
        public void Dispose()
        {
            if (_context != null)
                _context.Dispose();
        }

        public void SaveChanges()
        {
            _context.SaveChanges();
        }

        public async Task SaveChangesAsync()
        {
            await _context.SaveChangesAsync();
        }
    }
}
