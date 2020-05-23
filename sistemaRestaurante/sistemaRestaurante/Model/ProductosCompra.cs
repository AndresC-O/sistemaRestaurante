//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class ProductosCompra
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ProductosCompra()
        {
            this.DetallesCompra = new HashSet<DetallesCompra>();
            this.Almacen = new HashSet<Almacen>();
        }
    
        public int idProductoC { get; set; }
        public string nombre { get; set; }
        public Nullable<decimal> precio { get; set; }
        //public string categoria { get; set; }
        public Nullable<int> idProveedor { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DetallesCompra> DetallesCompra { get; set; }
        public virtual Proveedores Proveedores { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Almacen> Almacen { get; set; }
    }
}
