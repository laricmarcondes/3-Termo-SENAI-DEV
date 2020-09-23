using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ConexaoVagasAPI.Domains;
using ConexaoVagasAPI.Interfaces;
using ConexaoVagasAPI.Repositories;
using ConexaoVagasAPI.Utils;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ConexaoVagasAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CandidatoController : ControllerBase
    {
        /// <summary>
        /// Cria um objeto _candidatoRepository que irá receber todos os métodos definidos na interface
        /// </summary>
        private ICandidatoRepository _candidatoRepository { get; set; }

        public CandidatoController()
        {
            _candidatoRepository = new CandidatoRepository();
        }

        /// <summary>
        /// Lista todos os candidatos
        /// </summary>
        /// <returns>Uma lista de candidatos e um status code 200 - Ok</returns>
        /// dominio/api/Empresa
        [Authorize(Roles = "1")]
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public IActionResult Get()
        {
            //Retorna um StatusCode e faz uma chamada para o método .Listar()
            return Ok(_candidatoRepository.Listar());
        }

        /// <summary>
        /// Busca um Candidato pelo ID
        /// </summary>
        /// <param name="id"> ID do Candidato que será buscado </param>
        /// <returns> O Candidato buscado, com suas habilidades e candidaturas. </returns>
        /// <response code="200">OK</response>
        /// <response code="400">Dados inválidos.</response>
        /// <response code="404">Não encontrado</response>
        [Authorize(Roles = "1")]
        [HttpGet("{id}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(404)]
        [ProducesResponseType(400)]
        public IActionResult GetById(int id)
        {
            try
            {
                Candidato candidatoBuscado = _candidatoRepository.BuscarPorId(id);

                if (candidatoBuscado != null)
                    return Ok(candidatoBuscado);

                return NotFound("Nenhum candidato encontrado para o ID informado.");
            }
            catch (Exception error)
            {
                return BadRequest(error);
            }
        }

        /// <summary>
        /// Cadastra candidato
        /// </summary>
        /// <remarks>
        /// Body Request:
        /// 
        ///     {
        ///         "IdStatusUsuario": 2,
        ///         "Curso": "string",
        ///         "Matricula": "string",
        ///         "Cpf": "string",
        ///         "Rg": "string",
        ///         "Cep": "string",
        ///         "EnderecoCandidato": "string",
        ///         "NumeroEndereco": 255,
        ///         "TelefoneCandidato": "string",
        ///         "CelularCandidato": "string",
        ///         "DataNascimento": "2020-09-14T17:19:05.803Z",
        ///         "IdUsuarioNavigation": 
        ///         {
        ///             "IdTipoUsuario": 2,
        ///             "Email": "string",
        ///             "Senha": "string",
        ///             "DataCadastrado": "2020-09-14T19:23:14.896Z"
        ///         }
        ///     }
        ///     
        /// </remarks>
        /// <returns> Cadastra candidato </returns>
        [HttpPost]
        [ProducesResponseType(201)]
        [ProducesResponseType(400)]
        public IActionResult Post(Candidato novoCandidato)
        {
            try
            {
                novoCandidato.IdUsuarioNavigation.Senha = StringUtils.Criptografar(novoCandidato.IdUsuarioNavigation.Senha);
                _candidatoRepository.Cadastrar(novoCandidato);
                return StatusCode(201);
            }
            catch (Exception error)
            {
                return BadRequest(error);
            }
        }

        /// <summary>
        /// Atualiza o Candidato por id.
        /// </summary>
        /// <remarks>
        /// Body Request
        /// 
        ///     {
        ///         "IdStatusUsuario": 0,
        ///         "Curso": "string",
        ///         "Matricula": "string",
        ///         "Cpf": "string",
        ///         "Rg": "string",
        ///         "Cep": "string",
        ///         "EnderecoCandidato": "string",
        ///         "NumeroEndereco": 0,
        ///         "TelefoneCandidato": "string",
        ///         "CelularCandidato": "string",
        ///         "DataNascimento": "2020-09-14T17:19:05.803Z"
        ///     }
        /// 
        /// </remarks>
        /// <param name="id"> Id do Candidato </param>
        /// <param name="candidatoAtualizado"> Id do Candidato </param>
        /// <returns></returns>
        [Authorize(Roles = "3")]
        [HttpPut("{id}")]
        [ProducesResponseType(204)]
        [ProducesResponseType(400)]
        // TODO: Permitir o input de ID no HTTP é perigoso. 
        // TODO: Por isso, depois é necessário mudar isso para que pegue o ID guardado no JWT para usar esse ID como input.
        public IActionResult AtualizarPorId(int id, Candidato candidatoAtualizado)
        {
            try
            {
                _candidatoRepository.Atualizar(id, candidatoAtualizado);
                return Ok();
            }
            catch (Exception error)
            {
                return BadRequest(error);
            }
        }
    }
}
