using ConexaoVagasAPI.Domains;
using ConexaoVagasAPI.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ConexaoVagasAPI.Repositories
{
    public class HabilidadeRepository : IHabilidadeRepository
    {
        ConexaoVagasContext ctx = new ConexaoVagasContext();

        /// <summary>
        /// Lista tods as habilidades
        /// </summary>
        /// <returns>Lista das habilidades</returns>
        public List<Habilidade> Listar()
        {
            // Retorna uma lista com todas as informações das habilidades
            return ctx.Habilidade.ToList();
        }

        /// <summary>
        /// Busca uma habilidade através do ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns>A habilidade buscada</returns>
        public Habilidade BuscarPorId(int id)
        {
            // Retorna a primeira habilidade encontrada para o ID informado
            return ctx.Habilidade.FirstOrDefault(h => h.IdHabilidade == id);
        }

        /// <summary>
        /// Busca uma habilidade através do Nome
        /// </summary>
        /// <param name="name"></param>
        /// <returns>A habilidade buscada com suas informações</returns>
        public Habilidade BuscarPorNome(string name)
        {
            return ctx.Habilidade.FirstOrDefault(h => h.NomeHabilidade == name);
        }

        /// <summary>
        /// Cadastra uma nova habilidade
        /// </summary>
        /// <param name="novaHabilidade"></param>
        public void Cadastrar(Habilidade novaHabilidade)
        {
            // Adiciona novaHabilidade
            ctx.Habilidade.Add(novaHabilidade);

            // Salva as informações para serem gravadas no banco de dados
            ctx.SaveChanges();
        }

        /// <summary>
        /// Atualiza uma habilidade existente
        /// </summary>
        /// <param name="id"></param>
        /// <param name="habilidadeAtualizada">Objeto com as novas informações</param>
        public void Atualizar(int id, Habilidade habilidadeAtualizada)
        {
            // Busca uma habilidade através do id
            Habilidade habilidadeBuscada = ctx.Habilidade.Find(id);

            // Atribui os novos valores ao campos existentes
            habilidadeBuscada.NomeHabilidade = habilidadeAtualizada.NomeHabilidade;
            habilidadeBuscada.IdCriadoPor = habilidadeAtualizada.IdCriadoPor;

            // Atualiza a habilidade que foi buscada
            ctx.Habilidade.Update(habilidadeBuscada);

            // Salva as informações para serem gravadas no banco
            ctx.SaveChanges();
        }

        /// <summary>
        /// Deleta uma habilidade existente
        /// </summary>
        /// <param name="id">ID da habilidade que será deletada</param>
        public void Deletar(int id)
        {
            ctx.Habilidade.Remove(BuscarPorId(id));

            ctx.SaveChanges();
        }
    }
}
