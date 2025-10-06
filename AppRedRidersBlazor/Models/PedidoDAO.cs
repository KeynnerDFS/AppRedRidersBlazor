using AppRedRidersBlazor.Configs;

namespace AppRedRidersBlazor.Models
{
    public class PedidoDAO
    {
        private readonly Conexao _conexao;

        public PedidoDAO(Conexao conexao)
        {
            _conexao = conexao;
        }

        public void Inserir(Pedido pedido)
        {
            try
            {
                var comando = _conexao.CreateCommand("INSERT INTO produto VALUES (null, null, @_precoPelaEntrega, @_ondeEntregar, " +
                    "@_ondeBuscar, @_quantidade, @_descricao, @_cliente )");

                comando.Parameters.AddWithValue("@_precoPelaEntrega", pedido.PrecoPelaEntrega);
                comando.Parameters.AddWithValue("@_ondeEntregar", pedido.OndeEntregar);
                comando.Parameters.AddWithValue("@_ondeBuscar", pedido.OndeBuscar);
                comando.Parameters.AddWithValue("@_quantidade", pedido.Quantidade);
                comando.Parameters.AddWithValue("@_descricao", pedido.Descricao);
                comando.Parameters.AddWithValue("@_cliente", pedido.Cliente);



                comando.ExecuteNonQuery();

            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<Pedido> ListarTodos()
        {
            var lista = new List<Pedido>();

            var comando = _conexao.CreateCommand("SELECT * FROM produto");
            var leitor = comando.ExecuteReader();

            while (leitor.Read())
            {
                var pedido = new Pedido
                {
                    id = leitor.GetInt32("id_nope"),
                    PrecoPelaEntrega = leitor.GetFloat("precoPelaEntrega_nope"),
                    OndeEntregar = leitor.GetString("ondeEntregar_nope"),
                    OndeBuscar = leitor.GetString("ondeBuscar_nope"),
                    Quantidade = leitor.GetInt32("quantidade_nope"),
                    Descricao = leitor.IsDBNull(leitor.GetOrdinal("descricao_nope")) ? "" : leitor.GetString("descricao_nope"),
                    Cliente = leitor.GetString("cliente_nope")

                };

                lista.Add(pedido);
            }

            return lista;
        }
    }
}
