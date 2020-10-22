using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ConexaoVagasAPI.Domains;
using ConexaoVagasAPI.Interfaces;
using ConexaoVagasAPI.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ConexaoVagasAPI.Controllers
{
    // Define que o tipo de resposta da API será no formato JSON
    [Produces("application/json")]

    // Define que a rota de uma requisição será no formato domínio/api/NomeController
    [Route("api/[controller]")]

    // Define que é um controlador de API
    [ApiController]

    public class CandidaturaController : ControllerBase
    {
        /// <summary>
        /// Cria um objeto _candidaturaRepository que irá receber todos os métodos definidos na interface
        /// </summary>
        private ICandidaturaRepository _candidaturaRepository;

        /// <summary>
        /// Instancia este objeto para que haja a referência aos métodos no repositório
        /// </summary>
        public CandidaturaController()
        {
            _candidaturaRepository = new CandidaturaRepository();
        }

        /// <summary>
        /// Busca candidaturas de um usuário
        /// </summary>
        /// <returns>Uma candidatura buscada</returns>
        /// dominio/api/Candidatura/1
        [Authorize(Roles = "3")]
        [HttpGet("Token")]
        [ProducesResponseType(200)]
        [ProducesResponseType(404)]
        [ProducesResponseType(400)]
        public IActionResult GetByToken()
        {

            // Pega o ID que está guardado no token.
            int id = Convert.ToInt32(User.FindFirst("jti").Value);

            List<Candidatura> candidaturasUsuario = _candidaturaRepository.ListarPorId(id);

            return NotFound("Nenhum Usuário encontrado para no token.");
        }

        /// <summary>
        /// Cadastra uma nova candidatura
        /// </summary>
        /// <param name="novaCandidatura">Objeto novaCandidatura que será cadastrada</param>
        /// <returns>Os dados que foram enviados para cadastro e um status code 201 - Created</returns>
        /// dominio/api/Candidatura
        [Authorize(Roles = "3")]
        [HttpPost]
        public IActionResult Post(Candidatura novaCandidatura)
        {
            // Faz a chamada para o método .Cadastrar();
            _candidaturaRepository.Cadastrar(novaCandidatura);

            // Retorna o status code 201 - Created com a URL e o objeto cadastrado
            return StatusCode(201);
        }

        [Authorize(Roles = "2, 3")]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            Candidatura candidaturaBuscada = _candidaturaRepository.BuscarPorId(id);

            //Verifica se candidaturaBuscada é igual a nulo
            if (candidaturaBuscada == null)
            {
                //Se for igual a nulo, retorna um NotFound
                return NotFound();
            }

            //Se não for,deleta a candidatura e retorna um StatusCode Accepted
            _candidaturaRepository.Deletar(id);

            return StatusCode(202);
        }
    }
}