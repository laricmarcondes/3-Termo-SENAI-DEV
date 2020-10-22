using ConexaoVagasAPI.Domains;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ConexaoVagasAPI.Viewmodels
{
    public class CandidatoViewmodel
    {
        public int IdUsuario { get; set; }
        public string Curso { get; set; }
        public string EnderecoCandidato { get; set; }
        public int NumeroEndereco { get; set; }
        public DateTime DataNascimento { get; set; }
        public int Visualizacao { get; set; }
        public List<HabilidadeCandidato> HabilidadeCandidato { get; set; }

        /// <summary>
        /// Construtor do Viewmodel que aceita um objeto Domain para
        /// transformar em um objeto sem informmaçoes sensíveis (EmpresaViewModel).
        /// </summary>
        /// <param name="c"></param>
        public CandidatoViewmodel(Candidato c)
        {
            this.IdUsuario = c.IdUsuario;
            this.Curso = c.Curso;
            this.EnderecoCandidato = c.EnderecoCandidato;
            this.NumeroEndereco = c.NumeroEndereco;
            this.DataNascimento = c.DataNascimento;
            this.Visualizacao = c.Visualizacao;
            this.HabilidadeCandidato = c.HabilidadeCandidato.ToList();
        }
    }

}
