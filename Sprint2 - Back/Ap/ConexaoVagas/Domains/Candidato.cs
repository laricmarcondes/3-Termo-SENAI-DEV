using System;
using System.Collections.Generic;

namespace ConexaoVagasAPI.Domains
{
    public partial class Candidato
    {
        public Candidato()
        {
            Candidatura = new HashSet<Candidatura>();
            HabilidadeCandidato = new HashSet<HabilidadeCandidato>();
        }

        public int IdUsuario { get; set; }
        public int IdStatusUsuario { get; set; }
        public string Curso { get; set; }
        public string Matricula { get; set; }
        public string Cpf { get; set; }
        public string Rg { get; set; }
        public string Cep { get; set; }
        public string EnderecoCandidato { get; set; }
        public int NumeroEndereco { get; set; }
        public string TelefoneCandidato { get; set; }
        public string CelularCandidato { get; set; }
        public DateTime DataNascimento { get; set; }
        public int Visualizacao { get; set; }

        public StatusUsuario IdStatusUsuarioNavigation { get; set; }
        public Usuario IdUsuarioNavigation { get; set; }
        public ICollection<Candidatura> Candidatura { get; set; }
        public ICollection<HabilidadeCandidato> HabilidadeCandidato { get; set; }
    }
}
