using AppRedRidersBlazor.Configs;

namespace AppRedRidersBlazor.Models
{
    public class CardapioDAO
    {
        private readonly Conexao _conexao;

        public CardapioDAO(Conexao conexao)
        {
            _conexao = conexao;
        }

        public void Inserir(Cardapio cardapio)
        {
            try
            {
                var comando = _conexao.CreateCommand("INSERT INTO cadastrar_cardapio VALUES (null, @_nome, @_descricao,@_idCresFk,@_idCalo)");

                comando.Parameters.AddWithValue("@_nome", cardapio.nome);
                comando.Parameters.AddWithValue("@_descricao", cardapio.descricao);
                comando.Parameters.AddWithValue("@_idCresFk", cardapio.idCresFk);
                comando.Parameters.AddWithValue("@_idCalo", cardapio.idCaloFk);


                comando.ExecuteNonQuery();

            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<Cardapio> ListarTodos()
        {
            var lista = new List<Cardapio>();

            var comando = _conexao.CreateCommand("SELECT * FROM cadastrar_cardapio");
            var leitor = comando.ExecuteReader();

            while (leitor.Read())
            {
                var cardapio = new Cardapio
                {
                    Id = leitor.GetInt32("id_ccar"),
                    nome = leitor.GetString("nome_ccar"),
                    descricao = leitor.IsDBNull(leitor.GetOrdinal("descricao_ccar")) ? "" : leitor.GetString("descricao_ccar"),
                
                };

                lista.Add(cardapio);
            }

            return lista;
        }
    }
}
