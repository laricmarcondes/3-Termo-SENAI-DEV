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
        /// Lista Todas as Candidaturas
        /// </summary>
        /// <returns>Uma lista de candidaturas e um status code 200 - Ok</returns>
        /// dominio/api/Candidatura
        [Authorize(Roles = "2, 3")]
        [HttpGet]
        public IActionResult Get()
        {
            //Retorna um StatusCode e faz uma chamada para o método .Listar()
            return Ok(_candidaturaRepository.Listar());
        }

        /// <summary>
        /// Busca uma candidatura através do seu Id
        /// </summary>
        /// <param name="id">Id da candidatura que sera buscada</param>
        /// <returns>Uma candidatura buscada</returns>
        /// dominio/api/Candidatura/1
        [Authorize(Roles = "3")]
        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            //Retorna os dados buscados e um status code 200 - Ok
            return StatusCode(200, _candidaturaRepository.BuscarPorId(id));
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