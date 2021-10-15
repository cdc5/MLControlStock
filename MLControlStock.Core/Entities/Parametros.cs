using MLControlStock.Core.ApiClient.Content;
using MLControlStock.Core.Exceptions;
using System;
using System.Collections.Generic;
using System.Text;

namespace MLControlStock.Core.Entities
{
    public static class Parametros
    {
      

        public static string ActaEstaEnSenasa { get; set; }
        public static string ActaEstaEnFundacion { get; set; }

        public static string EntregaVacuna { get; set; }
        public static string DevolucionVacuna { get; set; }

        public static string Stock { get; set; }
        public static string StockDDJJ { get; set; }

        static Parametros()
        {
            AgregarActaEstaEn();
            CargarTipoEntregaDevolucionVacunas();
            CargarTipoStock();
        }

        public static void CargarTipoStock()
        {
            Stock = "Stock";
            StockDDJJ = "StockDDJJ";
        }

        public static void CargarTipoEntregaDevolucionVacunas()
        {
            EntregaVacuna = "Entrega";
            DevolucionVacuna = "Devolución";
        }



        public static void AgregarActaEstaEn()
        {
            ActaEstaEnSenasa = "Senasa";
            ActaEstaEnSenasa = "Fundación";

        }
       
    }
}
