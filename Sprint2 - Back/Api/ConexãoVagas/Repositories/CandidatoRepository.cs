﻿using ConexaoVagasAPI.Domains;
using ConexaoVagasAPI.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace ConexaoVagasAPI.Repositories
{
    public class CandidatoRepository : ICandidatoRepository
    {

        ConexaoVagasContext ctx = new ConexaoVagasContext();

        /// <summary>
        /// Lista todos os candidatos
        /// </summary>
        /// <returns></returns>
        public List<Candidato> Listar()
        {
            return ctx.Candidato.ToList();
        }

        /// <summary>
        /// Busca um candidato por id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Candidato BuscarPorId(int id)
        {
            return ctx.Candidato.Include(c => c.HabilidadeCandidato)
                                .Include(c => c.IdUsuarioNavigation)
                                .Include(c => c.Candidatura)
                                .FirstOrDefault(c => c.IdUsuario == id);
        }

        /// <summary>
        /// Cadastra um novo candidato
        /// </summary>
        /// <param name="novoCandidato"></param>
        public void Cadastrar(Candidato novoCandidato)
        {
            novoCandidato.IdUsuarioNavigation.IdTipoUsuario = (int)Enums.TipoUsuario.CANDIDATO;
            novoCandidato.IdStatusUsuario = (int)Enums.StatusUsuario.ATIVO;
            novoCandidato.IdUsuarioNavigation.DataCadastrado = DateTime.Now;

            ctx.Candidato.Add(novoCandidato);

            ctx.SaveChanges();
        }

        /// <summary>
        /// Atualiza o candidato por id
        /// </summary>
        /// <param name="id"></param>
        /// <param name="candidatoAtualizado"></param>
        public void Atualizar(int id, Candidato candidatoAtualizado)
        {
            var c = ctx.Candidato.Include(candidato => candidato.IdUsuarioNavigation)
                                 .FirstOrDefault(candidato => candidato.IdUsuario == id);
            if (c != null)
            {
                if (candidatoAtualizado.CelularCandidato != null)
                    c.CelularCandidato = candidatoAtualizado.CelularCandidato;

                if (candidatoAtualizado.Cep != null)
                    c.Cep = candidatoAtualizado.Cep;

                if (candidatoAtualizado.Cpf != null)
                    c.Cpf = candidatoAtualizado.Cpf;

                if (candidatoAtualizado.Curso != null)
                    c.Curso = candidatoAtualizado.Curso;

                if (candidatoAtualizado.DataNascimento != null)
                    c.DataNascimento = candidatoAtualizado.DataNascimento;

                if (candidatoAtualizado.EnderecoCandidato != null)
                    c.EnderecoCandidato = candidatoAtualizado.EnderecoCandidato;

                if (candidatoAtualizado.NumeroEndereco != 0)
                    c.NumeroEndereco = candidatoAtualizado.NumeroEndereco;

                if (candidatoAtualizado.Rg != null)
                    c.Rg = candidatoAtualizado.Rg;

                if (candidatoAtualizado.TelefoneCandidato != null)
                    c.TelefoneCandidato = candidatoAtualizado.TelefoneCandidato;

                if (candidatoAtualizado.IdUsuarioNavigation.Email != null)
                    c.IdUsuarioNavigation.Email = candidatoAtualizado.IdUsuarioNavigation.Email;

                if (candidatoAtualizado.IdUsuarioNavigation.Senha != null)
                    c.IdUsuarioNavigation.Senha = candidatoAtualizado.IdUsuarioNavigation.Senha;
            }
            ctx.SaveChanges();
        }

        /// <summary>
        /// Muda o status de um candidato
        /// </summary>
        /// <param name="id"></param>
        /// <param name="status"></param>
        public void MudarStatus(int id, int status)
        {
            var candidato = ctx.Candidato.Find(id);
            candidato.IdStatusUsuario = status;
            ctx.SaveChanges();
        }
    }
}
