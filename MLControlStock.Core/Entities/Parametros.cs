using FundaGes.Core.ApiClient.Content;
using FundaGes.Core.Exceptions;
using System;
using System.Collections.Generic;
using System.Text;

namespace FundaGes.Core.Entities
{
    public static class Parametros
    {
        public static List<Estados> Estados { set; get; }
        public static Estados Pendiente { set; get; }
        public static Estados Confirmado { set; get; }
        public static Estados Anulado { set; get; }
        public static Estados PendienteEnFundacion { set; get; }
        public static Estados Confirmada { set; get; }
        public static Estados Anulada { set; get; }

        public static TiposUsuario Fundacion { get; set; }
        public static TiposUsuario Vacunador { get; set; }
        public static List<TiposUsuario> TiposUsuario { get; set; }

        public static TokenSenasaContent TokenSenasaContent { get;set;}

        public static string ActaEstaEnSenasa { get; set; }
        public static string ActaEstaEnFundacion { get; set; }

        public static string EntregaVacuna { get; set; }
        public static string DevolucionVacuna { get; set; }

        public static string Stock { get; set; }
        public static string StockDDJJ { get; set; }

        static Parametros()
        {
            AgregarEstados();
            AgregarTiposUsuario();
            AgregarTokenSenasaTest();
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
        private static void AgregarTokenSenasaTest()
        {
            TokenSenasaContent  = new TokenSenasaContent("33-64402022-9", "33-64402022-9", "61137e75-f1f5-4cbe-9848-888217dee22f");
        }
        private static void AgregarTiposUsuario()
        {
            TiposUsuario = new List<TiposUsuario>();

            Fundacion = new TiposUsuario();
            Fundacion.Id = 1;
            Fundacion.Tipo = "Fundacion";
            TiposUsuario.Add(Fundacion);

            Vacunador = new TiposUsuario();
            Vacunador.Id = 2;
            Vacunador.Tipo = "Vacunador";
            TiposUsuario.Add(Vacunador);
        }

        public static int GetTipoUsuarioID(string tipousuario)
        {
            TiposUsuario tu = TiposUsuario.Find(x => x.Tipo == tipousuario);
            if (tu != null)
                return tu.Id;
            else
                throw new BusinessException("No se encuentra el id de Tipo Usuario:" + tipousuario);
        }


        private static void AgregarEstados()
        {
            Estados = new List<Estados>();

            Pendiente = new Estados();
            Pendiente.Id = 1;
            Pendiente.Nombre = "Pendiente";
            Estados.Add(Pendiente);

            Confirmado = new Estados();
            Confirmado.Id = 2;
            Confirmado.Nombre = "Confirmado";
            Estados.Add(Confirmado);

            Anulado = new Estados();
            Anulado.Id = 3;
            Anulado.Nombre = "Anulado";
            Estados.Add(Anulado);

            PendienteEnFundacion = new Estados();
            PendienteEnFundacion.Id = 4;
            PendienteEnFundacion.Nombre = "Pendiente en Fundación";
            Estados.Add(PendienteEnFundacion);

            Confirmada = new Estados();
            Confirmada.Id = 5;
            Confirmada.Nombre = "Confirmada";
            Estados.Add(Confirmada);

            Anulada = new Estados();
            Anulada.Id = 6;
            Anulada.Nombre = "Anulada";
            Estados.Add(Anulada);
        }

        public static int GetEstadoID(string estado)
        {
            Estados est = Estados.Find(x => x.Nombre == estado);
            if (est != null)
                return est.Id;
            else
                throw new BusinessException("No se encuentra el id de estado:" + estado);
        }
    }
}
