﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace sistemaRestaurante.Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class RestauranteBDEntities1 : DbContext
    {
        public RestauranteBDEntities1()
            : base("name=RestauranteBDEntities1")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Categorias> Categorias { get; set; }
        public virtual DbSet<Compraas> Compraas { get; set; }
        public virtual DbSet<DetallesCompra> DetallesCompra { get; set; }
        public virtual DbSet<DetallesVenta> DetallesVenta { get; set; }
        public virtual DbSet<ProductosCompra> ProductosCompra { get; set; }
        public virtual DbSet<ProductosVenta> ProductosVenta { get; set; }
        public virtual DbSet<Proveedores> Proveedores { get; set; }
        public virtual DbSet<Recetas> Recetas { get; set; }
        public virtual DbSet<Usuarios> Usuarios { get; set; }
        public virtual DbSet<Ventas> Ventas { get; set; }
        public virtual DbSet<Almacen> Almacen { get; set; }
    }
}
