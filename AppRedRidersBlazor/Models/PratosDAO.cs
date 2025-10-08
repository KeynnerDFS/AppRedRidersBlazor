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
                var comando = _conexao.CreateCommand("INSERT INTO cadastrar_pratos VALUES (null, @_nome, @_preco, @_descricao,@_idCcarFk,idCaloFk)");

                comando.Parameters.AddWithValue("@_nome", pratos.nome);
                comando.Parameters.AddWithValue("@_preco", pratos.preco);
                comando.Parameters.AddWithValue("@_descricao", pratos.descricao);
                comando.Parameters.AddWithValue("@_idCcarFk", pratos.idCcarFk);
                comando.Parameters.AddWithValue("@_idCaloFk", pratos.idCaloFk);


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

            var comando = _conexao.CreateCommand("SELECT * FROM cadastrar_pratos");
            var leitor = comando.ExecuteReader();

            while (leitor.Read())
            {
                var pratos = new Pratos
                {
                    Id = leitor.GetInt32("id_cpra"),
                    nome = leitor.GetString("nome_cpra"),
                    preco = leitor.GetFloat("preco_cpra"),
                    descricao = leitor.IsDBNull(leitor.GetOrdinal("descricao_cpra")) ? "" : leitor.GetString("descricao_cpra"),

                };

                lista.Add(pratos);
            }

            return lista;
        }
    }
}
