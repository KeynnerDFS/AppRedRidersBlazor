using AppRedRidersBlazor.Configs;

namespace AppRedRidersBlazor.Models
{
    public class VeiculoDAO
    {
        private readonly Conexao _conexao;

        public VeiculoDAO(Conexao conexao)
        {
            _conexao = conexao;
        }

        public void Inserir(Veiculo veiculo)
        {
            try
            {
                var comando = _conexao.CreateCommand("INSERT INTO produto VALUES (null,@_nome, @_modelo,@_marca,@_placa,@_cor,@_rotaimg )");

                comando.Parameters.AddWithValue("@_nome", veiculo.nome);
                comando.Parameters.AddWithValue("@_modelo", veiculo.modelo);
                comando.Parameters.AddWithValue("@_marca", veiculo.marca);
                comando.Parameters.AddWithValue("@_placa", veiculo.placa);
                comando.Parameters.AddWithValue("@_cor", veiculo.cor);
                comando.Parameters.AddWithValue("@_rotaimg", veiculo.rotaimg);



                comando.ExecuteNonQuery();

            }
            catch (Exception)
            {
                throw;
            }
        }
        public List<Veiculo> ListarTodos()
        {
            var lista = new List<Veiculo>();

            var comando = _conexao.CreateCommand("SELECT * FROM produto");
            var leitor = comando.ExecuteReader();

            while (leitor.Read())
            {
                var veiculo = new Veiculo
                {
                    Id = leitor.GetInt32("id_vei"),
                    nome = leitor.GetString("nome_dono_vei"),
                    modelo = leitor.GetString("modelo_vei"),
                    marca = leitor.GetString("marca_vei"),
                    placa = leitor.GetString("placa_vei"),
                    cor = leitor.GetString("cor_vei"),
                    rotaimg = leitor.GetString("rotaimg_vei")
                    //  descricao = leitor.IsDBNull(leitor.GetOrdinal("descricao_cpra")) ? "" : leitor.GetString("descricao_cpra"),

                };

                lista.Add(veiculo);
            }

            return lista;
        }
    }
}
