using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using MLControlStock.Core.Entities;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace MLControlStock.Infrastructure.Data
{
    public partial class MLControlStockContext : DbContext
    {
        public MLControlStockContext()
        {
        }

        public MLControlStockContext(DbContextOptions<MLControlStockContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Stock> Stock { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=DESKTOP-CIR5O8S;Database=MLControlStock;Integrated Security = true");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Stock>(entity =>
            {
                entity.HasKey(e => new { e.Deposito, e.Area, e.Pasillo, e.Fila, e.Cara, e.ProductId });

                entity.Property(e => e.Deposito)
                    .HasColumnName("deposito")
                    .HasMaxLength(4)
                    .IsUnicode(false);

                entity.Property(e => e.Area)
                    .HasColumnName("area")
                    .HasMaxLength(2)
                    .IsUnicode(false);

                entity.Property(e => e.Pasillo)
                    .HasColumnName("pasillo")
                    .HasMaxLength(2)
                    .IsUnicode(false);

                entity.Property(e => e.Fila)
                    .HasColumnName("fila")
                    .HasMaxLength(2)
                    .IsUnicode(false);

                entity.Property(e => e.Cara)
                    .HasColumnName("cara")
                    .HasMaxLength(2)
                    .IsUnicode(false);

                entity.Property(e => e.ProductId)
                    .HasColumnName("product_id")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Cantidad).HasColumnName("cantidad");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
