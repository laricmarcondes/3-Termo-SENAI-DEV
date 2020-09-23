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
    public class EmpresaController : ControllerBase
    {
        /// <summary>
        /// Cria um objeto _empresaRepository que irá receber todos os métodos definidos na interface
        /// </summary>
        private IEmpresaRepository _empresaRepository { get; set; }

        public EmpresaController()
        {
            _empresaRepository = new EmpresaRepository();
        }

        /// <summary>
        /// Lista todos as empresas
        /// </summary>
        /// <returns>Uma lista de empresas e um status code 200 - Ok</returns>
        /// dominio/api/Empresa
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public IActionResult Get()
        {
            //Retorna um StatusCode e faz uma chamada para o método .Listar()
            return Ok(_empresaRepository.Listar());
        }

        /// <summary>
        /// Busca um Empresa pelo ID
        /// </summary>
        /// <param name="id"> ID do Empresa que será buscado </param>
        /// <returns> O Empresa buscado, com suas habilidades e candidaturas. </returns>
        /// <response code="200">OK</response>
        /// <response code="400">Dados inválidos.</response>
        /// <response code="404">Não encontrado</response>
        [HttpGet("{id}")]
        [ProducesResponseType(200)]
        [ProducesResponseType(404)]
        [ProducesResponseType(400)]
        public IActionResult GetById(int id)
        {
            try
            {
                Empresa empresaBuscado = _empresaRepository.BuscarPorId(id);

                if (empresaBuscado != null)
                    return Ok(empresaBuscado);

                return NotFound("Nenhum empresa encontrado para o ID informado.");
            }
            catch (Exception error)
            {
                return BadRequest(error);
            }
        }

        /// <summary>
        /// Cadastra empresa
        /// </summary>
        /// <remarks>
        /// Body Request:
        /// 
        ///            {
        ///             "Foto": "string",
        ///             "Cnae": "string",
        ///             "Cnpj": "string",
        ///             "RazaoSocial": "string",
        ///             "TelefoneEmpresa": "string",
        ///             "CelularEmpresa": "string",
        ///             "Cep": "string",
        ///             "Endereco": "string",
        ///             "Numero": 0,
        ///             "Visualizacao": 0,
        ///             "IdUsuarioNavigation": {
        ///                 "Email": "string",
        ///                 "Senha": "string",
        ///                 }
        ///             } 
        ///     
        /// </remarks>
        /// <returns> Cadastra empresa </returns>
        [HttpPost]
        [ProducesResponseType(201)]
        [ProducesResponseType(400)]
        public IActionResult Post(Empresa novoEmpresa)
        {
            try
            {
                novoEmpresa.IdUsuarioNavigation.Senha = StringUtils.Criptografar(novoEmpresa.IdUsuarioNavigation.Senha);
                _empresaRepository.Cadastrar(novoEmpresa);
                return StatusCode(201);
            }
            catch (Exception error)
            {
                return BadRequest(error);
            }
        }

        /// <summary>
        /// Atualiza o Empresa por id.
        /// </summary>
        /// <remarks>
        /// Body Request
        /// 
        ///        {
        ///            "Foto": "string",
        ///            "Cnae": "string",
        ///            "Cnpj": "string",
        ///            "RazaoSocial": "string",
        ///            "TelefoneEmpresa": "string",
        ///            "CelularEmpresa": "string",
        ///            "Cep": "string",
        ///            "Endereco": "string",
        ///            "Numero": 0,
        ///            "Visualizacao": 0,
        ///         }
        /// 
        /// </remarks>
        /// <param name="id"> Id do Empresa </param>
        /// <param name="empresaAtualizado"> Id do Empresa </param>
        /// <returns></returns>
        [Authorize(Roles = "2")]
        [HttpPut("{id}")]
        [ProducesResponseType(204)]
        [ProducesResponseType(400)]
        // TODO: Permitir o input de ID no HTTP é perigoso. 
        // TODO: Por isso, depois é necessário mudar isso para que pegue o ID guardado no JWT para usar esse ID como input.
        public IActionResult AtualizarPorId(int id, Empresa empresaAtualizado)
        {
            try
            {
                _empresaRepository.Atualizar(id, empresaAtualizado);
                return Ok();
            }
            catch (Exception error)
            {
                return BadRequest(error);
            }
        }
    }
}
