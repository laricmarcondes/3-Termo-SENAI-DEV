using ConexaoVagasAPI.Domains;
using ConexaoVagasAPI.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ConexaoVagasAPI.Repositories
{
    public class VagaRepository : IVagaRepository
    {
        ConexaoVagasContext ctx = new ConexaoVagasContext();

        public List<Vaga> Listar()
        {
            // Retorna uma lista com todas as informações das vagas
            return ctx.Vaga.Include(v => v.BeneficioVaga)
                           .Include(v => v.HabilidadeVaga)
                           .ToList();
        }

        public List<Vaga> ListarPorEmpresa(int id)
        {
            return ctx.Vaga.Where(v => v.IdEmpresa == id).ToList();
        }

        public List<Vaga> ListarPorTitulo(string titulo)
        {
            return ctx.Vaga.Where(h => h.Titulo.Contains(titulo))
                           .ToList();
        }

        public List<Vaga> ListarPorFiltro(string titulo, decimal minSalario, int idHabilidade)
        {
            IQueryable<Vaga> vagas = ctx.Vaga;

            if (!string.IsNullOrEmpty(titulo) || !string.IsNullOrWhiteSpace(titulo))
                vagas = vagas.Where(v => v.Titulo.Contains(titulo));

            if (minSalario != 0)
                vagas = vagas.Where(v => v.Salario <= minSalario);

            if (idHabilidade != 0)
                vagas = vagas.Where(v => v.HabilidadeVaga.Any(hv => hv.IdHabilidade == idHabilidade));

            return vagas.ToList();
        }

        public Vaga BuscarPorId(int id)
        {
            // Retorna a primeira vaga encontrada para o ID informado
            return ctx.Vaga.FirstOrDefault(h => h.IdVaga == id);
        }

        public void Cadastrar(Vaga novaVaga)
        {
            // Adiciona novaVaga
            ctx.Vaga.Add(novaVaga);

            // Salva as informações para serem gravadas no banco de dados
            ctx.SaveChanges();
        }

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

        public void Deletar(int id)
        {
            ctx.Vaga.Remove(BuscarPorId(id));

            ctx.SaveChanges();
        }
    }
}

