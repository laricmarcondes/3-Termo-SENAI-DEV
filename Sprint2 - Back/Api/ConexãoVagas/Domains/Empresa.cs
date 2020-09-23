using System;
using System.Collections.Generic;

namespace ConexaoVagasAPI.Domains
{
    public partial class Empresa
    {
        public Empresa()
        {
            Vaga = new HashSet<Vaga>();
        }

        public int IdUsuario { get; set; }
        public int IdStatusUsuario { get; set; }
        public string Foto { get; set; }
        public string Cnae { get; set; }
        public string Cnpj { get; set; }
        public string RazaoSocial { get; set; }
        public string TelefoneEmpresa { get; set; }
        public string CelularEmpresa { get; set; }
        public string Cep { get; set; }
        public string Endereco { get; set; }
        public int Numero { get; set; }
        public int Visualizacao { get; set; }

        public StatusUsuario IdStatusUsuarioNavigation { get; set; }
        public Usuario IdUsuarioNavigation { get; set; }
        public ICollection<Vaga> Vaga { get; set; }


    }
}
