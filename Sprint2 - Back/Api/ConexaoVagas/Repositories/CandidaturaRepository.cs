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

        public List<Candidatura> Listar()
        {
            // Retorna uma lista com todas as informações das candidaturas
            return ctx.Candidatura.ToList();
        }

        public List<Candidatura> ListarPorId(int id)
        {
            return ctx.Candidatura.Where(c => c.IdCandidato == id)
                                  .ToList();
        }

        public Candidatura BuscarPorId(int id)
        {
            // Retorna a primeira candidatura encontrada para o ID informado
            return ctx.Candidatura.FirstOrDefault(h => h.IdCandidatura == id);
        }

        public void Cadastrar(Candidatura novaCandidatura)
        {
            // Adiciona novacandidatura
            ctx.Candidatura.Add(novaCandidatura);

            // Salva as informações para serem gravadas no banco de dados
            ctx.SaveChanges();
        }

        public void Deletar(int id)
        {
            ctx.Candidatura.Remove(BuscarPorId(id));

            ctx.SaveChanges();
        }
    }
}
