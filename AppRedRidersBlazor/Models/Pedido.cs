namespace AppRedRidersBlazor.Models
{

    public class Pedido
    {
        public int id { get; set; }
        public float? PrecoPelaEntrega { get; set; }
        public string? OndeEntregar { get; set; }    
        public string? OndeBuscar { get; set; }
        public int? Quantidade { get; set; }
        public string? Descricao { get; set; }
        public string? Cliente { get; set; }
    }
}
