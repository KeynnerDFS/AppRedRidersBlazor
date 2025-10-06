using AppRedRidersBlazor.Configs;

namespace AppRedRidersBlazor.Models
{
    public class LoginDAO
    {
        private readonly Conexao _conexao;

        public LoginDAO(Conexao conexao)
        {
            _conexao = conexao;
        }

        public void Inserir(Login login)
        {
            try
            {
                var comando = _conexao.CreateCommand("INSERT INTO produto VALUES (null, null, @_email, @_senha )");

                comando.Parameters.AddWithValue("@_email", login.email);
                comando.Parameters.AddWithValue("@_senha", login.senha);
                


                comando.ExecuteNonQuery();

            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<Login> ListarTodos()
        {
            var lista = new List<Login>();

            var comando = _conexao.CreateCommand("SELECT * FROM produto");
            var leitor = comando.ExecuteReader();

            while (leitor.Read())
            {
                var login = new Login
                {
                    Id = leitor.GetInt32("id_calo"),
                    email = leitor.GetString("email_calo"),
                    senha = leitor.GetString("senha_calo"),
                    // descricao = leitor.IsDBNull(leitor.GetOrdinal("descricao_ccar")) ? "" : leitor.GetString("descricao_ccar"),

                };

                lista.Add(login);
            }

            return lista;
        }
    }
}
