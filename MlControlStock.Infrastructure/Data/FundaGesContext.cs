using System;
using FundaGes.Core.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace FundaGes.Infrastructure.Data
{
    public partial class FundaGesContext : DbContext
    {
        public FundaGesContext()
        {
        }

        public FundaGesContext(DbContextOptions<FundaGesContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Actas> Actas { get; set; }
        public virtual DbSet<ActasAnimales> ActasAnimales { get; set; }
        public virtual DbSet<Animales> Animales { get; set; }
        public virtual DbSet<Campañas> Campañas { get; set; }
        public virtual DbSet<Especies> Especies { get; set; }
        public virtual DbSet<Establecimiento> Establecimiento { get; set; }
        public virtual DbSet<Estados> Estados { get; set; }
        public virtual DbSet<Fundaciones> Fundaciones { get; set; }
        public virtual DbSet<Heladeras> Heladeras { get; set; }
        public virtual DbSet<MiembrosFundacion> MiembrosFundacion { get; set; }
        public virtual DbSet<Renspas> Renspas { get; set; }
        public virtual DbSet<Subcentros> Subcentros { get; set; }
        public virtual DbSet<TipoIdentificacion> TipoIdentificacion { get; set; }
        public virtual DbSet<TiposUsuario> TiposUsuario { get; set; }
        public virtual DbSet<Turnos> Turnos { get; set; }
        public virtual DbSet<TurnosRenspas> TurnosRenspas { get; set; }
        public virtual DbSet<TurnosVacunas> TurnosVacunas { get; set; }
        public virtual DbSet<Usuarios> Usuarios { get; set; }
        public virtual DbSet<Vacunadores> Vacunadores { get; set; }
        public virtual DbSet<Vacunas> Vacunas { get; set; }
        public virtual DbSet<VacunasStock> VacunasStock { get; set; }

//        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//        {
//            if (!optionsBuilder.IsConfigured)
//            {
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
//                optionsBuilder.UseSqlServer("Server=DESKTOP-CIR5O8S;Database=FundaGes;Integrated Security = true");
//            }
//        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Actas>(entity =>
            {
                entity.HasKey(e => e.Codigo);

                entity.ToTable("actas");

                entity.Property(e => e.Codigo)
                    .HasColumnName("codigo")
                    .HasMaxLength(50);

                entity.Property(e => e.Anulada).HasColumnName("anulada");

                entity.Property(e => e.CampaniaCarga)
                    .HasColumnName("campaniaCarga")
                    .HasMaxLength(50);

                entity.Property(e => e.CantidadBubVacunadosBrucelosis).HasColumnName("cantidadBubVacunadosBrucelosis");

                entity.Property(e => e.CantidadDosis).HasColumnName("cantidadDosis");

                entity.Property(e => e.CantidadVacunadosBrucelosis).HasColumnName("cantidadVacunadosBrucelosis");

                entity.Property(e => e.Carbunclo).HasColumnName("carbunclo");

                entity.Property(e => e.DosisBrucelosis).HasColumnName("dosisBrucelosis");

                entity.Property(e => e.EsActaTotal).HasColumnName("esActaTotal");

                entity.Property(e => e.EstaPaga).HasColumnName("estaPaga");

                entity.Property(e => e.Estado).HasColumnName("estado");

                entity.Property(e => e.FechaCarbunclo).HasColumnName("fechaCarbunclo");

                entity.Property(e => e.FechaCarga).HasColumnName("fechaCarga");

                entity.Property(e => e.FechaConfirmacion).HasColumnName("fechaConfirmacion");

                entity.Property(e => e.FechaVacunacion).HasColumnName("fechaVacunacion");

                entity.Property(e => e.FundacionId).HasColumnName("fundacion_id");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Identificacion).HasColumnName("Identificacion");

                entity.Property(e => e.NumeroSerie)
                    .HasColumnName("numeroSerie")
                    .HasMaxLength(50);

                entity.Property(e => e.NumeroSerieBrucelosis)
                    .HasColumnName("numeroSerieBrucelosis")
                    .HasMaxLength(50);

                entity.Property(e => e.Observaciones)
                    .HasColumnName("observaciones")
                    .HasMaxLength(255);

                entity.Property(e => e.Renspa)
                    .HasColumnName("renspa")
                    .HasMaxLength(255);

                entity.Property(e => e.RequiereConfirmacion).HasColumnName("requiereConfirmacion");

                entity.Property(e => e.UsuarioAnulacion)
                    .HasColumnName("usuarioAnulacion")
                    .HasMaxLength(255);

                entity.Property(e => e.UsuarioConfirmacion)
                    .HasColumnName("usuarioConfirmacion")
                    .HasMaxLength(50);

                entity.Property(e => e.UsuarioCreador)
                    .HasColumnName("usuarioCreador")
                    .HasMaxLength(50);

                entity.Property(e => e.Vacuna)
                    .HasColumnName("vacuna")
                    .HasMaxLength(255);

                entity.Property(e => e.VacunaBrucelosis)
                    .HasColumnName("vacunaBrucelosis")
                    .HasMaxLength(255);

                entity.Property(e => e.Vacunador)
                    .HasColumnName("vacunador")
                    .HasMaxLength(255);

                entity.HasOne(d => d.EstadoNavigation)
                    .WithMany(p => p.Actas)
                    .HasForeignKey(d => d.Estado)
                    .HasConstraintName("FK_actas_estados");

                entity.HasOne(d => d.Fundacion)
                    .WithMany(p => p.Actas)
                    .HasForeignKey(d => d.FundacionId)
                    .HasConstraintName("FK_actas_fundaciones");

                entity.Ignore(e => e.NombreEstado);
            });

            modelBuilder.Entity<ActasAnimales>(entity =>
            {
                entity.HasKey(e => new { e.ActasCodigo, e.AnimalesID});

                entity.ToTable("actas_animales");

                entity.Property(e => e.ActasCodigo)
                    .HasColumnName("actas_codigo")
                    .HasMaxLength(50);

                entity.Property(e => e.AnimalesID)
                    .HasColumnName("animales_id");
                    

                entity.Property(e => e.AnimalesNombre)
                    .HasColumnName("animales_nombre")
                    .HasMaxLength(50);

                entity.Property(e => e.AnimalesCodigo)
                    .HasColumnName("animales_codigo")
                    .HasMaxLength(10);

                entity.Property(e => e.Cantidad).HasColumnName("cantidad");

                entity.HasOne(d => d.ActasCodigoNavigation)
                    .WithMany(p => p.ActasAnimales)
                    .HasForeignKey(d => d.ActasCodigo)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_actas_animales_actas");
            });

            modelBuilder.Entity<ActasAnimalesDDJJ>(entity =>
            {
                entity.HasKey(e => new { e.ActasCodigo, e.AnimalesID });

                entity.ToTable("actas_animales_ddjj");

                entity.Property(e => e.ActasCodigo)
                    .HasColumnName("actas_codigo")
                    .HasMaxLength(50);

                entity.Property(e => e.AnimalesID)
                    .HasColumnName("animales_id");
                    

                entity.Property(e => e.AnimalesNombre)
                    .HasColumnName("animales_nombre")
                    .HasMaxLength(50);

                entity.Property(e => e.AnimalesCodigo)
                    .HasColumnName("animales_codigo")
                    .HasMaxLength(10);

                entity.Property(e => e.Cantidad).HasColumnName("cantidad");

                entity.HasOne(d => d.ActasCodigoNavigation)
                    .WithMany(p => p.ActasAnimalesDDJJ)
                    .HasForeignKey(d => d.ActasCodigo)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_actas_animales_ddjj_actas");
            });

            modelBuilder.Entity<Animales>(entity =>
            {
                entity.HasKey(e => e.id);                    

                entity.Property(e => e.Codigo).HasMaxLength(10);

                entity.Property(e => e.EspecieId).HasColumnName("EspecieID");

                entity.Property(e => e.Nombre).HasMaxLength(255);

                entity.Property(e => e.UmCodigo).HasColumnName("UM_codigo");

                entity.Property(e => e.UmId).HasColumnName("UM_id");

                entity.Property(e => e.UmNombre)
                    .HasColumnName("UM_nombre")
                    .HasMaxLength(255);

                entity.HasOne(d => d.Especie)
                    .WithMany(p => p.Animales)
                    .HasForeignKey(d => d.EspecieId)
                    .HasConstraintName("FK__Animales__Especi__6EF57B66");
            });

            modelBuilder.Entity<Campañas>(entity =>
            {
                entity.HasKey(e => e.Codigo);

                entity.Property(e => e.Codigo)
                    .HasColumnName("codigo")
                    .HasMaxLength(50);

                entity.Property(e => e.Anio).HasColumnName("anio");

                entity.Property(e => e.EsDeMenores).HasColumnName("esDeMenores");

                entity.Property(e => e.Fin).HasColumnName("fin");

                entity.Property(e => e.Inicio).HasColumnName("inicio");

                entity.Property(e => e.NumeroCampania).HasColumnName("numeroCampania");

                entity.Property(e => e.PlanDeVacunacion)
                    .HasColumnName("planDeVacunacion")
                    .HasMaxLength(50);

                entity.Property(e => e.VacunaSoloDeRiesgo).HasColumnName("vacunaSoloDeRiesgo");
            });

            modelBuilder.Entity<Especies>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .ValueGeneratedNever();

                entity.Property(e => e.Nombre).HasMaxLength(255);
            });

            modelBuilder.Entity<Establecimiento>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasMaxLength(50);

                entity.Property(e => e.FundacionId).HasColumnName("fundacion_id");

                entity.Property(e => e.Nombre)
                    .HasColumnName("nombre")
                    .HasMaxLength(150);

                entity.Property(e => e.Titular)
                    .HasColumnName("titular")
                    .HasMaxLength(150);

                entity.HasOne(d => d.Fundacion)
                    .WithMany(p => p.Establecimiento)
                    .HasForeignKey(d => d.FundacionId)
                    .HasConstraintName("FK_Establecimiento_fundaciones");
            });

            modelBuilder.Entity<Estados>(entity =>
            {
                entity.ToTable("estados");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Nombre)
                    .HasColumnName("nombre")
                    .HasMaxLength(255);
            });

            modelBuilder.Entity<Fundaciones>(entity =>
            {
                entity.ToTable("fundaciones");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Cuit)
                    .HasColumnName("cuit")
                    .HasMaxLength(50);

                entity.Property(e => e.FechaCreacion).HasColumnName("fecha_creacion");

                entity.Property(e => e.Nombre)
                    .HasColumnName("nombre")
                    .HasMaxLength(255);

                entity.Property(e => e.TokenSenasa)
                    .HasColumnName("token_senasa")
                    .HasMaxLength(500);

                entity.Property(e => e.wsUsername)
                   .HasColumnName("wsUsername")
                   .HasMaxLength(500);
            });

            modelBuilder.Entity<Heladeras>(entity =>
            {
                entity.ToTable("heladeras");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.FundacionId).HasColumnName("fundacion_id");

                entity.Property(e => e.Nombre)
                    .HasColumnName("nombre")
                    .HasMaxLength(255);

                entity.Property(e => e.SubcentroId).HasColumnName("subcentro_id");

                entity.HasOne(d => d.Fundacion)
                    .WithMany(p => p.Heladeras)
                    .HasForeignKey(d => d.FundacionId)
                    .HasConstraintName("FK__heladeras__funda__3F466844");

                entity.HasOne(d => d.Subcentro)
                    .WithMany(p => p.Heladeras)
                    .HasForeignKey(d => d.SubcentroId)
                    .HasConstraintName("FK__heladeras__subce__403A8C7D");
            });

            modelBuilder.Entity<MiembrosFundacion>(entity =>
            {
                entity.ToTable("miembros_fundacion");

                entity.HasIndex(e => e.UsuarioId)
                    .HasName("idx_miembros_fundacion_notnull")
                    .IsUnique()
                    .HasFilter("([usuario_id] IS NOT NULL)");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Cuit)
                    .HasColumnName("cuit")
                    .HasMaxLength(50);

                entity.Property(e => e.FechaCreacion).HasColumnName("fecha_creacion");

                entity.Property(e => e.FundacionId).HasColumnName("fundacion_id");

                entity.Property(e => e.Nombre)
                    .HasColumnName("nombre")
                    .HasMaxLength(255);

                entity.Property(e => e.TokenSenasa)
                    .HasColumnName("token_senasa")
                    .HasMaxLength(500);

                entity.Property(e => e.UsuarioId).HasColumnName("usuario_id");

                entity.HasOne(d => d.Fundacion)
                    .WithMany(p => p.MiembrosFundacion)
                    .HasForeignKey(d => d.FundacionId)
                    .HasConstraintName("FK_miembros_fundacion_fundaciones");

                entity.HasOne(d => d.Usuario)
                    .WithOne(p => p.MiembrosFundacion)
                    .HasForeignKey<MiembrosFundacion>(d => d.UsuarioId)
                    .HasConstraintName("FK_miembros_fundacion_usuarios");
            });

            modelBuilder.Entity<Renspas>(entity =>
            {
                entity.HasKey(e => e.Renspa);

                entity.ToTable("renspas");

                entity.HasIndex(e => e.Renspa)
                    .HasName("UQ__renspas__3213E83EB5D404C5")
                    .IsUnique();

                entity.Property(e => e.Renspa)
                    .HasColumnName("renspa")
                    .HasMaxLength(50);

                entity.Property(e => e.Bueyes).HasColumnName("bueyes");

                entity.Property(e => e.CodigoPlan).HasColumnName("codigo_plan");

                entity.Property(e => e.EstablecimientoId)
                    .HasColumnName("establecimiento_id")
                    .HasMaxLength(50);

                entity.Property(e => e.FundacionId).HasColumnName("fundacion_id");

                entity.Property(e => e.Latitud)
                    .HasColumnName("latitud")
                    .HasColumnType("decimal(10, 8)");

                entity.Property(e => e.Longitud)
                    .HasColumnName("longitud")
                    .HasColumnType("decimal(10, 8)");

                entity.Property(e => e.Novillitos).HasColumnName("novillitos");

                entity.Property(e => e.Novillos).HasColumnName("novillos");

                entity.Property(e => e.Partido)
                    .HasColumnName("partido")
                    .HasMaxLength(150);

                entity.Property(e => e.Provincia)
                    .HasColumnName("provincia")
                    .HasMaxLength(70);

                entity.Property(e => e.Superficie).HasColumnName("superficie");

                entity.Property(e => e.Terneras).HasColumnName("terneras");

                entity.Property(e => e.Terneros).HasColumnName("terneros");

                entity.Property(e => e.Titular)
                    .HasColumnName("titular")
                    .HasMaxLength(150);

                entity.Property(e => e.Toritos).HasColumnName("toritos");

                entity.Property(e => e.Toros).HasColumnName("toros");

                entity.Property(e => e.TotalBovinos).HasColumnName("total_bovinos");

                entity.Property(e => e.Vacas).HasColumnName("vacas");

                entity.Property(e => e.Vaquillonas).HasColumnName("vaquillonas");

                entity.HasOne(d => d.Establecimiento)
                    .WithMany(p => p.Renspas)
                    .HasForeignKey(d => d.EstablecimientoId)
                    .HasConstraintName("FK_renspas_Establecimiento");
            });

            modelBuilder.Entity<Subcentros>(entity =>
            {
                entity.ToTable("subcentros");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.FundacionId).HasColumnName("fundacion_id");

                entity.Property(e => e.Nombre)
                    .HasColumnName("nombre")
                    .HasMaxLength(255);

                entity.HasOne(d => d.Fundacion)
                    .WithMany(p => p.Subcentros)
                    .HasForeignKey(d => d.FundacionId)
                    .HasConstraintName("FK__subcentro__funda__3E52440B");
            });

            modelBuilder.Entity<TipoIdentificacion>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("Tipo_identificacion");

                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .HasMaxLength(5);

                entity.Property(e => e.Value)
                    .HasColumnName("value")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<TiposUsuario>(entity =>
            {
                entity.ToTable("tipos_usuario");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.FechaCreacion).HasColumnName("fecha_creacion");

                entity.Property(e => e.Tipo)
                    .HasColumnName("tipo")
                    .HasMaxLength(255);
            });

            modelBuilder.Entity<Turnos>(entity =>
            {
                entity.ToTable("turnos");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CantAftosa).HasColumnName("cant_aftosa");

                entity.Property(e => e.CantBruselosis).HasColumnName("cant_bruselosis");

                entity.Property(e => e.EstablecimientoId)
                    .HasColumnName("establecimiento_id")
                    .HasMaxLength(50);

                entity.Property(e => e.EstablecimientoNombre)
                    .HasColumnName("establecimiento_nombre")
                    .HasMaxLength(150);

                entity.Property(e => e.Estado).HasColumnName("estado");

                entity.Property(e => e.FechaCreacion).HasColumnName("fecha_creacion");

                entity.Property(e => e.FechaTurnoVacunacion).HasColumnName("fecha_turno_vacunacion");

                entity.Property(e => e.FundacionCuit)
                    .HasColumnName("fundacion_cuit")
                    .HasMaxLength(50);

                entity.Property(e => e.FundacionId).HasColumnName("fundacion_id");

                entity.Property(e => e.HoraTurnoVacunacion).HasColumnName("hora_turno_vacunacion");

                entity.Property(e => e.UsuarioCreador).HasColumnName("usuario_creador");

                entity.Property(e => e.VacunadorCuit)
                    .HasColumnName("vacunador_cuit")
                    .HasMaxLength(50);

                entity.Property(e => e.VacunadorId).HasColumnName("vacunador_id");

                entity.Property(e => e.VacunadorNombre)
                    .HasColumnName("vacunador_nombre")
                    .HasMaxLength(255);

                entity.HasOne(d => d.Establecimiento)
                    .WithMany(p => p.Turnos)
                    .HasForeignKey(d => d.EstablecimientoId)
                    .HasConstraintName("FK_turnos_Establecimiento");

                entity.HasOne(d => d.EstadoNavigation)
                    .WithMany(p => p.Turnos)
                    .HasForeignKey(d => d.Estado)
                    .HasConstraintName("FK_turnos_estados");

                entity.HasOne(d => d.Fundacion)
                    .WithMany(p => p.Turnos)
                    .HasForeignKey(d => d.FundacionId)
                    .HasConstraintName("FK_turnos_fundaciones");

                entity.HasOne(d => d.Vacunador)
                    .WithMany(p => p.Turnos)
                    .HasForeignKey(d => d.VacunadorId)
                    .HasConstraintName("FK_turnos_vacunadores");
            });

            modelBuilder.Entity<TurnosRenspas>(entity =>
            {
                entity.HasKey(e => new { e.TurnosId, e.RenspasId });

                entity.ToTable("turnos_renspas");

                entity.Property(e => e.TurnosId).HasColumnName("turnos_id");

                entity.Property(e => e.RenspasId)
                    .HasColumnName("renspas_id")
                    .HasMaxLength(50);

                entity.HasOne(d => d.Renspas)
                    .WithMany(p => p.TurnosRenspas)
                    .HasForeignKey(d => d.RenspasId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__turnos_re__rensp__45F365D3");

                entity.HasOne(d => d.Turnos)
                    .WithMany(p => p.TurnosRenspas)
                    .HasForeignKey(d => d.TurnosId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__turnos_re__turno__44FF419A");
            });

            modelBuilder.Entity<TurnosVacunas>(entity =>
            {
                entity.ToTable("turnos_vacunas");

                entity.Property(e => e.Id)
                    .HasColumnName("id");
                    

                entity.Property(e => e.CantidadDevolucion).HasColumnName("cantidad_devolucion");

                entity.Property(e => e.CantidadEntregada).HasColumnName("cantidad_entregada");

                entity.Property(e => e.FechaDevolucion).HasColumnName("fecha_devolucion");

                entity.Property(e => e.FundacionId).HasColumnName("fundacion_id");

                entity.Property(e => e.FechaEntrega).HasColumnName("fecha_entrega");
                
                entity.Property(e => e.VacunadorCuit).HasColumnName("vacunador_cuit").HasMaxLength(50);
                
                entity.Property(e => e.VacunadorNombre).HasColumnName("vacunador_nombre").HasMaxLength(255);

                entity.Property(e => e.TemperaturaDevolucion)
                    .HasColumnName("temperatura_devolucion")
                    .HasColumnType("decimal(18, 0)");

                entity.Property(e => e.TemperaturaSalida)
                    .HasColumnName("temperatura_salida")
                    .HasColumnType("decimal(18, 0)");

                entity.Property(e => e.TurnosId).HasColumnName("turnos_id");

                entity.Property(e => e.VacunasStockId).HasColumnName("vacunas_stock_id");

                entity.HasOne(d => d.Turnos)
                    .WithMany(p => p.TurnosVacunas)
                    .HasForeignKey(d => d.TurnosId)
                    .HasConstraintName("FK__turnos_va__turno__4316F928");

                entity.HasOne(d => d.VacunasStock)
                    .WithMany(p => p.TurnosVacunas)
                    .HasForeignKey(d => d.VacunasStockId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__turnos_va__vacun__440B1D61");

                
            });

            modelBuilder.Entity<Usuarios>(entity =>
            {
                entity.ToTable("usuarios");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.FechaCreacion).HasColumnName("fecha_creacion");

                entity.Property(e => e.FundacionId).HasColumnName("fundacion_id");

                entity.Property(e => e.Pass)
                    .HasColumnName("pass")
                    .HasMaxLength(255);

                entity.Property(e => e.TipoUsuario).HasColumnName("tipo_usuario");

                entity.Property(e => e.Usuario)
                    .HasColumnName("usuario")
                    .HasMaxLength(255);

                entity.HasOne(d => d.Fundacion)
                    .WithMany(p => p.Usuarios)
                    .HasForeignKey(d => d.FundacionId)
                    .HasConstraintName("FK_usuarios_fundaciones");

                entity.HasOne(d => d.TipoUsuarioNavigation)
                    .WithMany(p => p.Usuarios)
                    .HasForeignKey(d => d.TipoUsuario)
                    .HasConstraintName("FK__usuarios__tipo_u__3B75D760");

                //Modificado a mano
                entity.Ignore(e => e.NombreUsuario);
                entity.Ignore(e => e.Cuit);
                entity.Ignore(e => e.IDMiembroFundOVacunador);
            });

            modelBuilder.Entity<Vacunadores>(entity =>
            {
                entity.ToTable("vacunadores");

                entity.HasIndex(e => e.UsuarioId)
                    .HasName("idx_vacunadores_notnull")
                    .IsUnique()
                    .HasFilter("([usuario_id] IS NOT NULL)");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Cuit)
                    .HasColumnName("cuit")
                    .HasMaxLength(50);

                entity.Property(e => e.FechaCreacion).HasColumnName("fecha_creacion");

                entity.Property(e => e.FundacionId).HasColumnName("fundacion_id");

                entity.Property(e => e.Nombre)
                    .HasColumnName("nombre")
                    .HasMaxLength(255);

                entity.Property(e => e.TokenSenasa)
                    .HasColumnName("token_senasa")
                    .HasMaxLength(500);

                entity.Property(e => e.UsuarioId).HasColumnName("usuario_id");

                entity.HasOne(d => d.Fundacion)
                    .WithMany(p => p.Vacunadores)
                    .HasForeignKey(d => d.FundacionId)
                    .HasConstraintName("FK_vacunadores_fundaciones");

                entity.HasOne(d => d.Usuario)
                    .WithOne(p => p.Vacunadores)
                    .HasForeignKey<Vacunadores>(d => d.UsuarioId)
                    .HasConstraintName("FK_vacunadores_usuarios");
            });

            modelBuilder.Entity<Vacunas>(entity =>
            {
                entity.ToTable("vacunas");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Codigo)
                    .HasColumnName("codigo")
                    .HasMaxLength(50);

                entity.Property(e => e.Descripcion)
                    .HasColumnName("descripcion")
                    .HasMaxLength(50);

                entity.Property(e => e.Identificador)
                    .HasColumnName("identificador")
                    .HasMaxLength(10);

                entity.Property(e => e.Marca)
                    .HasColumnName("marca")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<VacunasStock>(entity =>
            {
                entity.ToTable("vacunas_stock");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Cantidad).HasColumnName("cantidad");

                entity.Property(e => e.EstadoId).HasColumnName("estado_id");

                entity.Property(e => e.FechaCreacion).HasColumnName("fecha_creacion");
                entity.Property(e => e.FechaVencimiento).HasColumnName("fecha_vencimiento");

                entity.Property(e => e.FundacionId).HasColumnName("fundacion_id");

                entity.Property(e => e.HeladeraId).HasColumnName("heladera_id");

                entity.Property(e => e.Partida).HasColumnName("partida");

                entity.Property(e => e.SubcentroId).HasColumnName("subcentro_id");

                entity.Property(e => e.VacunasId).HasColumnName("vacunas_id");

                entity.HasOne(d => d.Estado)
                    .WithMany(p => p.VacunasStock)
                    .HasForeignKey(d => d.EstadoId)
                    .HasConstraintName("FK_vacunas_estados");

                entity.HasOne(d => d.Fundacion)
                    .WithMany(p => p.VacunasStock)
                    .HasForeignKey(d => d.FundacionId)
                    .HasConstraintName("FK_vacunas_stock_fundaciones");

                entity.HasOne(d => d.Heladera)
                    .WithMany(p => p.VacunasStock)
                    .HasForeignKey(d => d.HeladeraId)
                    .HasConstraintName("FK__vacunas__helader__3D5E1FD2");

                entity.HasOne(d => d.Subcentro)
                    .WithMany(p => p.VacunasStock)
                    .HasForeignKey(d => d.SubcentroId)
                    .HasConstraintName("FK_vacunas_stock_subcentros");

                entity.HasOne(d => d.Vacunas)
                    .WithMany(p => p.VacunasStock)
                    .HasForeignKey(d => d.VacunasId)
                    .HasConstraintName("FK__vacunas__tipos_v__3C69FB99");
            });

          //  OnModelCreatingPartial(modelBuilder);
        }

     //   partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
