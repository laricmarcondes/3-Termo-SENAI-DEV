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
    [Route("api/[controller]")]
    [Produces("application/json")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        /// <summary>
        /// Cria um objeto _usuarioRepository que irá receber todos os métodos definidos na interface
        /// </summary>
        private IUsuarioRepository _usuarioRepository { get; set; }

        public UsuarioController()
        {
            _usuarioRepository = new UsuarioRepository();
        }

        /// <summary>
        /// Lista usuários
        /// </summary>
        /// <returns> Lista de usuários</returns>
        /// <response code="200">OK</response>
        [Authorize(Roles = "1")]
        [HttpGet]
        [ProducesResponseType(200)]
        [ProducesResponseType(400)]
        public IActionResult GetList()
        {
            try
            {
                return Ok(_usuarioRepository.Listar());
            }
            catch (Exception error)
            {
                return BadRequest(error);
            }
        }

        /// <summary>
        /// Busca um Usuário pelo ID
        /// </summary>
        /// <param name="id"> ID do Usuário que será buscado </param>
        /// <returns> O Usuário buscado </returns>
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
                Usuario usuarioBuscado = _usuarioRepository.BuscarPorId(id);

                if (usuarioBuscado != null)
                    return Ok(usuarioBuscado);

                return NotFound("Nenhum Usuário encontrado para o ID informado");
            }
            catch (Exception error)
            {
                return BadRequest(error);
            }
        }

        /// <summary>
        /// Busca um usuario através do email
        /// </summary>
        /// <param name="email"></param>
        /// <returns>O usuario buscado com suas informações</returns>
        [HttpGet("pesquisarEmail/{email}")]
        public IActionResult GetByEmail(string email)
        {
            //Retorna os dados buscados e um status code 200 - Ok
            return StatusCode(200, _usuarioRepository.BuscarPorEmail(email));
        }

        /// <summary>
        /// Deleta usuário
        /// </summary>
        /// <returns> Deleta usuario </returns>
        /// <response code="204">No Content</response>
        /// <response code="404">Bad Request</response>
        [Authorize(Roles = "1")]
        [HttpDelete("{id}")]
        [ProducesResponseType(204)]
        [ProducesResponseType(400)]
        public IActionResult Delete(int id)
        {
            try
            {
                _usuarioRepository.Deletar(id);
                return Ok();
            }
            catch (Exception error)
            {
                return BadRequest(error);
            }
        }
    }
}
