using ConexaoVagasAPI.Domains;
using ConexaoVagasAPI.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ConexaoVagasAPI.Repositories
{
    public class VagaRepository : IVagaRepository
    {
        ConexaoVagasContext ctx = new ConexaoVagasContext();

        /// <summary>
        /// Lista tods as vagas
        /// </summary>
        /// <returns>Lista das vagas</returns>
        public List<Vaga> Listar()
        {
            // Retorna uma lista com todas as informações das vagas
            return ctx.Vaga.ToList();
        }

        /// <summary>
        /// Busca uma vaga através do ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns>A vaga buscada</returns>
        public Vaga BuscarPorId(int id)
        {
            // Retorna a primeira vaga encontrada para o ID informado
            return ctx.Vaga.FirstOrDefault(h => h.IdVaga == id);
        }

        /// <summary>
        /// Busca uma vaga através do Nome
        /// </summary>
        /// <param name="titulo"></param>
        /// <returns>A vaga buscada com suas informações</returns>
        public Vaga BuscarPorTitulo(string titulo)
        {
            return ctx.Vaga.FirstOrDefault(h => h.Titulo == titulo);
        }

        /// <summary>
        /// Cadastra uma nova vaga
        /// </summary>
        /// <param name="novaVaga"></param>
        public void Cadastrar(Vaga novaVaga)
        {
            // Adiciona novaVaga
            ctx.Vaga.Add(novaVaga);

            // Salva as informações para serem gravadas no banco de dados
            ctx.SaveChanges();
        }

        /// <summary>
        /// Atualiza uma vaga existente
        /// </summary>
        /// <param name="id"></param>
        /// <param name="vagaAtualizada">Objeto com as novas informações</param>
        public void Atualizar(int id, Vaga vagaAtualizada)
        {
            // Busca uma vaga através do id
            Vaga vagaBuscada = ctx.Vaga.Find(id);

            // Atribui os novos valores ao campos existentes
            vagaBuscada.Titulo = vagaAtualizada.Titulo;
            vagaBuscada.Salario = vagaAtualizada.Salario;
            vagaBuscada.Local = vagaAtualizada.Local;
            vagaBuscada.Cep = vagaAtualizada.Cep;
            vagaBuscada.Qualificacao = vagaAtualizada.Qualificacao;
            vagaBuscada.DataCriado = vagaAtualizada.DataCriado;
            vagaBuscada.DataExpiracao = vagaAtualizada.DataExpiracao;
            vagaBuscada.CargaHoraria = vagaAtualizada.CargaHoraria;
            vagaBuscada.Descricao = vagaAtualizada.Descricao;
            vagaBuscada.Visualizacao = vagaAtualizada.Visualizacao;
            vagaBuscada.IdEmpresaNavigation = vagaAtualizada.IdEmpresaNavigation;
            vagaBuscada.BeneficioVaga = vagaAtualizada.BeneficioVaga;
            vagaBuscada.Candidatura = vagaAtualizada.Candidatura;
            vagaBuscada.HabilidadeVaga = vagaAtualizada.HabilidadeVaga;


            // Atualiza a vaga que foi buscada
            ctx.Vaga.Update(vagaBuscada);

            // Salva as informações para serem gravadas no banco
            ctx.SaveChanges();
        }

        /// <summary>
        /// Deleta uma vaga existente
        /// </summary>
        /// <param name="id">ID da vaga que será deletada</param>
        public void Deletar(int id)
        {
            ctx.Vaga.Remove(BuscarPorId(id));

            ctx.SaveChanges();
        }
    }
}

