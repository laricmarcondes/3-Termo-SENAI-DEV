import { Empresa } from "../interfaces/empresa";
import { EmpresaViewmodel } from "../interfaces/empresaViewmodel";
import { API_URL, TOKEN_KEY } from "./apisettings";

const CONTROLLER = "Empresa/";

/**
 * Lista os empresas.
 */
function listar(): Promise<EmpresaViewmodel[]> {
    return fetch(API_URL + CONTROLLER, {
        method: "GET",
        headers: {
            authorization: 'Bearer ' + localStorage.getItem(TOKEN_KEY)
        }
    })
        .then(response => {
            return response.json();
        })
        .catch(err => console.error(err));
}

/**
 * 
 * @param id ID do empresa
 * @returns O empresa buscado.
 */
function buscarPorId(id: number): Promise<EmpresaViewmodel> {
    // http://localhost:5000/api/Empresa/5
    return fetch(API_URL + CONTROLLER + id, {
        method: "GET",
        headers: {
            authorization: 'Bearer ' + localStorage.getItem(TOKEN_KEY)
        }
    })
        .then(response => {
            return response.json();
        })
        .catch(err => console.error(err));
}

/**
 * 
 * @param empresa Objeto empresa a ser adicionado/atualizado.
 * @param id ID do empresa a ser atualizado.  O valor é 0 quando apenas quer adicionar.
 * @returns Objeto empresa se a operação for feita com sucesso, caso contrário retorno nada.
 */
function salvar(empresa: Empresa, id: number): Promise<Empresa> {

    const method = (id === 0 ? 'POST' : 'PUT');
    const urlRequest = (id === 0 ? API_URL + CONTROLLER : API_URL + CONTROLLER + id);

    return fetch(urlRequest, {
        method: method,
        body: JSON.stringify(empresa),
        headers: {
            'content-type': 'application/json',
            authorization: 'Bearer ' + localStorage.getItem('token-filmes')
        }
    })
        .then(() => {
            return empresa as any;
        })
        .catch(err => console.error(err));
}

export default {listar, buscarPorId, salvar}