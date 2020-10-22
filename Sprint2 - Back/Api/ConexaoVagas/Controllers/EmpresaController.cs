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
        /// <response code="200">OK</response>
        [Authorize]
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public IActionResult Get()
        {
            // Instancia a lista de candidatos.
            List<EmpresaViewmodel> empresas = new List<EmpresaViewmodel>();

            // Converte a lista de Empresas para uma lista protegida de Empresas.
            foreach (var empresa in _empresaRepository.Listar())
                empresas.Add(new EmpresaViewmodel(empresa));

            //Retorna um StatusCode 200 e a lista de Empresas.
            return Ok(empresas);
        }

        /// <summary>
        /// Busca um Empresa pelo ID
        /// </summary>
        /// <param name="id"> ID do Empresa que será buscado </param>
        /// <returns> O Empresa buscado, com suas habilidades e candidaturas. </returns>
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
                Empresa empresaBuscado = _empresaRepository.BuscarPorId(id);

                if (empresaBuscado != null)
                    return Ok(new EmpresaViewmodel(empresaBuscado));

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
        /// <response code="201">Cadastrado</response>
        /// <response code="400">Dados inválidos</response>
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
        /// Atualiza o Empresa por token.
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
        /// <response code="204">Atualizado</response>
        /// <response code="400">Dados inválidos</response>
        /// <returns></returns>
        [Authorize(Roles = "2")]
        [HttpPut("{id}")]
        [ProducesResponseType(204)]
        [ProducesResponseType(400)]
        public IActionResult AtualizarPorToken(int id, Empresa empresaAtualizado)
        {
            try
            {
                empresaAtualizado.IdUsuarioNavigation.Senha = StringUtils.Criptografar(empresaAtualizado.IdUsuarioNavigation.Senha);
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
