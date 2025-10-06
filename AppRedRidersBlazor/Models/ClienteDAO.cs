using AppRedRidersBlazor.Configs;

namespace AppRedRidersBlazor.Models
{
    public class ClienteDAO
    {
        private readonly Conexao _conexao;

        public ClienteDAO(Conexao conexao)
        {
            _conexao = conexao;
        }

        public void Inserir(Cliente cliente)
        {
            try
            {
                var comando = _conexao.CreateCommand("INSERT INTO produto VALUES (null, null, @_nome, @_distanciaMoradia, @_FormaDePagamento, @_endereco, @_FormaDeContado  )");

                comando.Parameters.AddWithValue("@_nome", cliente.nome);
                comando.Parameters.AddWithValue("@_distanciaMoradia", cliente.distanciaMoradia);
                comando.Parameters.AddWithValue("@_FormaDePagamento", cliente.FormaDePagamento);
                comando.Parameters.AddWithValue("@_endereco", cliente.endereco);
                comando.Parameters.AddWithValue("@_FormaDeContado", cliente.FormaDeContato);


                comando.ExecuteNonQuery();

            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<Cliente> ListarTodos()
        {
            var lista = new List<Cliente>();

            var comando = _conexao.CreateCommand("SELECT * FROM produto");
            var leitor = comando.ExecuteReader();

            while (leitor.Read())
            {
                var cliente = new Cliente
                {
                    Id = leitor.GetInt32("id_ccli"),
                    nome = leitor.GetString("nome_ccli"),
                    distanciaMoradia = leitor.GetString("distanciaMoradia_ccli"),
                    FormaDePagamento = leitor.GetString("FormaDePagamento_ccli"),
                    endereco = leitor.GetString("endereco_ccli"),
                    FormaDeContato = leitor.GetString("FormaDeContato_ccli"),
                   // descricao = leitor.IsDBNull(leitor.GetOrdinal("descricao_ccar")) ? "" : leitor.GetString("descricao_ccar"),

                };

                lista.Add(cliente);
            }

            return lista;
        }
    }
}
