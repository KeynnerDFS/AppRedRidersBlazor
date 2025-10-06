using AppRedRidersBlazor.Configs;

namespace AppRedRidersBlazor.Models
{
    public class RestauranteDAO
    {
        private readonly Conexao _conexao;

        public RestauranteDAO(Conexao conexao)
        {
            _conexao = conexao;
        }

        public void Inserir(Restaurante restaurante)
        {
            try
            {
                var comando = _conexao.CreateCommand("INSERT INTO produto VALUES (null, null, @_nome, @_telefone,@_endereco,@_cnpj,@_imagem )");

                comando.Parameters.AddWithValue("@_nome", restaurante.nome);
                comando.Parameters.AddWithValue("@_telefone", restaurante.Telefone);
                comando.Parameters.AddWithValue("@_endereco", restaurante.endereco);
                comando.Parameters.AddWithValue("@_cnpj", restaurante.CNPJ);
                comando.Parameters.AddWithValue("@_imagem", restaurante.imagem);


                comando.ExecuteNonQuery();

            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<Restaurante> ListarTodos()
        {
            var lista = new List<Restaurante>();

            var comando = _conexao.CreateCommand("SELECT * FROM produto");
            var leitor = comando.ExecuteReader();

            while (leitor.Read())
            {
                var restaurante = new Restaurante
                {
                    Id = leitor.GetInt32("id_cres"),
                    nome = leitor.GetString("nome_cres"),
                    Telefone = leitor.GetInt32("telefone_cres"),
                    endereco = leitor.GetString("endereco_cres"),
                    CNPJ = leitor.GetInt32("cnpj_cres"),
                    imagem = leitor.GetString("imagem_cres"),
                    //  descricao = leitor.IsDBNull(leitor.GetOrdinal("descricao_cpra")) ? "" : leitor.GetString("descricao_cpra"),

                };

                lista.Add(restaurante);
            }

            return lista;
        }
    }
}
