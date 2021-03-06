﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using sistemaRestaurante.Model;

namespace sistemaRestaurante.Vistas.Administrador
{
    public partial class FrmAlmacen : Form
    {
        public FrmAlmacen()
        {
            InitializeComponent();
        }

        public void CargarDatos()
        {
            using(RestauranteBDEntities1 bd = new RestauranteBDEntities1())
            {
                var JoinAlmacen = from almacen in bd.Almacen
                                  from prodC in bd.ProductosCompra
                                  where almacen.idProductoC == prodC.idProductoC
                                  orderby almacen.cantidadDisponible ascending 
                                  select new
                                  {
                                      ID = prodC.idProductoC,
                                      NOMBREPROD = prodC.nombre,
                                      CANTIDAD = almacen.cantidadDisponible
                                  };
                foreach (var iterar in JoinAlmacen)
                {
                    dtvAlmacen.Rows.Add(iterar.ID, iterar.NOMBREPROD, Math.Round(Convert.ToDouble(iterar.CANTIDAD)));
                }
            }
        }
        private void FrmAlmacen_Load(object sender, EventArgs e)
        {
            CargarDatos();
        }

        private void btnRefrescar_Click(object sender, EventArgs e)
        {
            dtvAlmacen.Rows.Clear();
            CargarDatos();
        }
    }
}
