using ConexaoVagasAPI.Domains;
using ConexaoVagasAPI.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ConexaoVagasAPI.Repositories
{
    public class BeneficioRepository : IBeneficioRepository
    {
        ConexaoVagasContext ctx = new ConexaoVagasContext();

        /// <summary>
        /// Lista todos os benecicios
        /// </summary>
        /// <returns>Lista dos beneficios</returns>
        public List<Beneficio> Listar()
        {
            return ctx.Beneficio.ToList();
        }

        /// <summary>
        /// Busca um beneficio pelo id
        /// </summary>
        /// <param name="id"></param>
        /// <returns>O beneficio buscado</returns>
        public Beneficio BuscarPorId(int id)
        {
            return ctx.Beneficio.FirstOrDefault(b => b.IdBeneficio == id);  
        }

        /// <summary>
        /// Busca um beneficio pelo nome
        /// </summary>
        /// <param name="name"></param>
        /// <returns>O beneficio buscado e suas informações</returns>
        public Beneficio BuscarPorNome(string name)
        {
            return ctx.Beneficio.FirstOrDefault(h => h.NomeBeneficio == name);
        }

        /// <summary>
        /// Cadastra um novo beneficio
        /// </summary>
        /// <param name="novoBeneficio"></param>
        public void Cadastrar(Beneficio novoBeneficio)
        {
            ctx.Beneficio.Add(novoBeneficio);

            ctx.SaveChanges();
        }

        /// <summary>
        /// Deleta um beneficio
        /// </summary>
        /// <param name="id"></param>
        public void Deletar(int id)
        {
            ctx.Beneficio.Remove(BuscarPorId(id));

            ctx.SaveChanges(); 
        }

    }
}
