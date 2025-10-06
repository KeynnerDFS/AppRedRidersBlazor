using AppRedRidersBlazor.Configs;

namespace AppRedRidersBlazor.Models
{
    public class PratosDAO
    {
        private readonly Conexao _conexao;

        public PratosDAO(Conexao conexao)
        {
            _conexao = conexao;
        }

        public void Inserir(Pratos pratos)
        {
            try
            {
                var comando = _conexao.CreateCommand("INSERT INTO produto VALUES (null, null, @_nome, @_preco, @_descricao,)");

                comando.Parameters.AddWithValue("@_nome", pratos.nome);
                comando.Parameters.AddWithValue("@_preco", pratos.preco);
                comando.Parameters.AddWithValue("@_descricao", pratos.descricao);


                comando.ExecuteNonQuery();

            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<Pratos> ListarTodos()
        {
            var lista = new List<Pratos>();

            var comando = _conexao.CreateCommand("SELECT * FROM produto");
            var leitor = comando.ExecuteReader();

            while (leitor.Read())
            {
                var pratos = new Pratos
                {
                    Id = leitor.GetInt32("id_cpra"),
                    nome = leitor.GetString("nome_cpra"),
                    preco = leitor.GetFloat("nome_cpra"),
                    descricao = leitor.IsDBNull(leitor.GetOrdinal("descricao_cpra")) ? "" : leitor.GetString("descricao_cpra"),

                };

                lista.Add(pratos);
            }

            return lista;
        }
    }
}
