using ConexaoVagasAPI.Domains;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ConexaoVagasAPI.Interfaces
{
    interface IVagaRepository
    {
        /// <summary>
        /// Lista todas as Candidaturas
        /// </summary>
        /// <returns>Uma lista das candidaturas</returns>
        List<Vaga> Listar();

        /// <summary>
        /// Busca uma candidatura pelo id
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Uma candidatura</returns>
        Vaga BuscarPorId(int id);

        /// <summary>
        /// Busca uma candidatura pelo id
        /// </summary>
        /// <param name="titulo"></param>
        /// <returns>Uma candidatura</returns>
        Vaga BuscarPorTitulo(string titulo);


        /// <summary>
        /// Atualiza uma habilidade existente
        /// </summary>
        /// <param name="id"></param>
        /// <param name="VagaAtualizada"></param>
        void Atualizar(int id, Vaga VagaAtualizada);


        /// <summary>
        /// Cadastra uma nova candidatura
        /// </summary>
        /// <param name="novaVaga">Objeto novaCandidatura que será cadastrada</param>
        void Cadastrar(Vaga novaVaga);

        /// <summary>
        /// Deleta uma habilidade
        /// </summary>
        /// <param name="id"></param>
        void Deletar(int id);

    }
}
