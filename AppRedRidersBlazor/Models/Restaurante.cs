﻿using Microsoft.AspNetCore.Http.HttpResults;

namespace AppRedRidersBlazor.Models
{

    public class Restaurante
    {
        public int Id { get; set; }
        public string? nome { get; set; }
        public string? Telefone { get; set; }
        public string? endereco { get; set; }
        public string? CNPJ { get; set; }
        public string? imagem { get; set; }
        public int? idCaloFk { get; set; }
    }
}
