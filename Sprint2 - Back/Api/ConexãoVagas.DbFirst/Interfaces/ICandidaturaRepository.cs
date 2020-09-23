using ConexaoVagasAPI.Domains;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ConexaoVagasAPI.Interfaces
{
    interface ICandidaturaRepository
    {
        /// <summary>
        /// Lista todas as Candidaturas
        /// </summary>
        /// <returns>Uma lista das candidaturas</returns>
        List<Candidatura> Listar();

        /// <summary>
        /// Busca uma candidatura pelo id
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Uma candidatura</returns>
        Candidatura BuscarPorId(int id);

        /// <summary>
        /// Cadastra uma nova candidatura
        /// </summary>
        /// <param name="novaCandidatura">Objeto novaCandidatura que será cadastrada</param>
        void Cadastrar(Candidatura novaCandidatura);

        /// <summary>
        /// Deleta uma candidatura
        /// </summary>
        /// <param name="id"></param>
        void Deletar(int id);



    }
}
