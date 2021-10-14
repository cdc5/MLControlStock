namespace FundaGes.Core.DTOs
{
    public class HeladeraDtoOut
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public int? FundacionId { get; set; }
        public int? SubcentroId { get; set; }
        public string SubcentroNombre { get; set; }
    }
}