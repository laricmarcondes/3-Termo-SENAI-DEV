using ConexaoVagasAPI.Domains;
using ConexaoVagasAPI.Interfaces;
using ConexaoVagasAPI.Utils;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ConexaoVagasAPI.Repositories
{
    class EmpresaRepository : IEmpresaRepository
    {
        ConexaoVagasContext ctx = new ConexaoVagasContext();

        /// <summary>
        /// Listar todas as empresas
        /// </summary>
        /// <returns></returns>
        public List<Empresa> Listar()
        {
            return ctx.Empresa.ToList();
        }

        /// <summary>
        /// Busca uma empresa pelo id
        /// </summary>
        /// <param name="id"></param>
        /// <returns>A empresa buscada</returns>
        public Empresa BuscarPorId(int id)
        {
            return ctx.Empresa.Include(e => e.Vaga).ThenInclude(v => v.BeneficioVaga)
                              .Include(e => e.Vaga).ThenInclude(v => v.HabilidadeVaga)
                              .Include(e => e.Vaga).ThenInclude(v => v.Candidatura)
                              .Include(e => e.IdUsuarioNavigation)
                              .FirstOrDefault(e => e.IdUsuario == id);
        }

        /// <summary>
        /// Cadastra uma nove empresa
        /// </summary>
        /// <param name="novaEmpresa"></param>
        public void Cadastrar(Empresa novaEmpresa)
        {
            novaEmpresa.IdUsuarioNavigation.IdTipoUsuario = (int)Enums.TipoUsuario.EMPRESA;
            novaEmpresa.IdStatusUsuario = (int)Enums.StatusUsuario.PENDENTE;
            novaEmpresa.IdUsuarioNavigation.DataCadastrado = DateTime.Now;

            ctx.Empresa.Add(novaEmpresa);

            ctx.SaveChanges();
        }

        /// <summary>
        /// Atualiza uma empresa pelo id
        /// </summary>
        /// <param name="id"></param>
        /// <param name="empresaAtualizada"></param>
        public void Atualizar(int id, Empresa empresaAtualizada)
        {
            var e = ctx.Empresa.Include(empresa => empresa.IdUsuarioNavigation)
                                       .FirstOrDefault(empresa => empresa.IdUsuario == id);
            if (e != null)
            {
                if (empresaAtualizada.CelularEmpresa != null)
                    e.CelularEmpresa = empresaAtualizada.CelularEmpresa;

                if (empresaAtualizada.Foto != null)
                    e.Foto = empresaAtualizada.Foto;

                if (empresaAtualizada.Cep != null)
                    e.Cep = empresaAtualizada.Cep;

                if (empresaAtualizada.Cnae != null)
                    e.Cnae = empresaAtualizada.Cnae;

                if (empresaAtualizada.Cnpj != null)
                    e.Cnpj = empresaAtualizada.Cnpj;

                if (empresaAtualizada.RazaoSocial != null)
                    e.RazaoSocial = empresaAtualizada.RazaoSocial;

                if (empresaAtualizada.TelefoneEmpresa != null)
                    e.TelefoneEmpresa = empresaAtualizada.TelefoneEmpresa;

                if (empresaAtualizada.Endereco != null)
                    e.Endereco = empresaAtualizada.Endereco;

                if (empresaAtualizada.Numero != 0)
                    e.Numero = empresaAtualizada.Numero;

                if (empresaAtualizada.IdUsuarioNavigation.Email != null)
                    e.IdUsuarioNavigation.Email = empresaAtualizada.IdUsuarioNavigation.Email;

                if (empresaAtualizada.IdUsuarioNavigation.Senha != null)
                    e.IdUsuarioNavigation.Senha = empresaAtualizada.IdUsuarioNavigation.Senha;
            }
            ctx.SaveChanges();
        }

        /// <summary>
        /// Musa o status de uma empresa
        /// </summary>
        /// <param name="id"></param>
        /// <param name="status"></param>
        public void MudarStatus(int id, int status)
        {
            var empresa = ctx.Empresa.Find(id);
            empresa.IdStatusUsuario = status;
            ctx.SaveChanges();
        }
    }
}
