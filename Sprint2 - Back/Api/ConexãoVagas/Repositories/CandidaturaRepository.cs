using ConexaoVagasAPI.Domains;
using ConexaoVagasAPI.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ConexaoVagasAPI.Repositories
{
    public class CandidaturaRepository : ICandidaturaRepository
    {

        ConexaoVagasContext ctx = new ConexaoVagasContext();


        /// <summary>
        /// Lista tods as candidaturas
        /// </summary>
        /// <returns>Lista das candidaturas</returns>
        public List<Candidatura> Listar()
        {
            // Retorna uma lista com todas as informações das candidaturas
            return ctx.Candidatura.ToList();
        }

        /// <summary>
        /// Busca uma candidatura através do ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns>A candidatura buscada</returns>
        public Candidatura BuscarPorId(int id)
        {
            // Retorna a primeira candidatura encontrada para o ID informado
            return ctx.Candidatura.FirstOrDefault(h => h.IdCandidatura == id);
        }

        /// <summary>
        /// Cadastra uma nova candidatura
        /// </summary>
        /// <param name="novaCandidatura"></param>
        public void Cadastrar(Candidatura novaCandidatura)
        {
            // Adiciona novacandidatura
            ctx.Candidatura.Add(novaCandidatura);

            // Salva as informações para serem gravadas no banco de dados
            ctx.SaveChanges();
        }

        /// <summary>
        /// Deleta uma candidatura existente
        /// </summary>
        /// <param name="id">ID da candidatura que será deletada</param>
        public void Deletar(int id)
        {
            ctx.Candidatura.Remove(BuscarPorId(id));

            ctx.SaveChanges();
        }
    }
}
