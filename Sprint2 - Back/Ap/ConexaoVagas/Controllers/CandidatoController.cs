using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ConexaoVagasAPI.Domains;
using ConexaoVagasAPI.Interfaces;
using ConexaoVagasAPI.Repositories;
using ConexaoVagasAPI.Utils;
using ConexaoVagasAPI.Viewmodels;
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
        /// <returns>Uma lista de candidatos com dados públicos. </returns>
        /// <response code="200">OK</response>
        [Authorize]
        [HttpGet]
        [ProducesResponseType(200)]
        [ProducesResponseType(404)]
        public IActionResult Get()
        {
            // Instancia a lista de candidatos.
            List<CandidatoViewmodel> candidatos = new List<CandidatoViewmodel>();

            // Converte a lista de Candidato para uma lista protegida de Candidatos.
            foreach (var candidato in _candidatoRepository.Listar())
                candidatos.Add(new CandidatoViewmodel(candidato));

            //Retorna um StatusCode 200 e a lista de candidatos.
            return Ok(candidatos);
        }

        /// <summary>
        /// Busca um Candidato pelo ID
        /// </summary>
        /// <param name="id"> ID do Candidato que será buscado </param>
        /// <returns> O Candidato buscado, com suas habilidades e candidaturas. </returns>
        /// <response code="200">OK</response>
        /// <response code="400">Dados inválidos</response>
        /// <response code="404">Não encontrado</response>
        [Authorize]
        [HttpGet("{id}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(404)]
        [ProducesResponseType(400)]
        public IActionResult GetById(int id)
        {
            try
            {
                Candidato candidato = _candidatoRepository.BuscarPorId(id);

                // Retorna o candidato com dados protegidos pelo Viewmodel.
                if (candidato != null)
                    return Ok(new CandidatoViewmodel(candidato)); 

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
        /// <response code="201">Cadastrado</response>
        /// <response code="400">Dados inválidos.</response>
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
        /// <param name="candidatoAtualizado"> Candidato atualizado </param>
        /// <response code="201">Atualizado</response>
        /// <response code="400">Dados inválidos</response>
        [Authorize(Roles = "3")]
        [HttpPut]
        [ProducesResponseType(204)]
        [ProducesResponseType(400)]
        public IActionResult AtualizarPorToken(Candidato candidatoAtualizado)
        {
            try
            {
                // Pega o ID que está guardado no token.
                int id = Convert.ToInt32(User.FindFirst("jti").Value);

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
