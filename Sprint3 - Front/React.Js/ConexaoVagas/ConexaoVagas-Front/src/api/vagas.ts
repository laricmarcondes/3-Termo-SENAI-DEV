import { Vaga } from "../interfaces/vaga";
import { API_URL, TOKEN_KEY } from "./apisettings";

const CONTROLLER = "Vaga/";

/**
 * Lista os vagas.
 */
function listar(): Promise<Vaga[]> {
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
 * @param id ID do vaga
 * @returns O vaga buscado.
 */
function buscarPorId(id: number): Promise<Vaga> {
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
 * @param id ID da empresa.
 */
function buscarPorEmpresa(id: number): Promise<Vaga> {
    return fetch(API_URL + CONTROLLER + `Empresa/${id}`, {
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
 * @param titulo Nome da vaga
 * @param minSalario Salário mínimo
 * @param idHabilidade ID da habilidade relacionada
 */
function buscarPorFiltro(titulo: string, minSalario: number, idHabilidade: number): Promise<Vaga> {
    var filtro: string = `Filtro?titulo=${titulo}minSalario=${minSalario}id=${idHabilidade}`

    return fetch(API_URL + CONTROLLER + filtro, {
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
 * @param vaga Objeto vaga a ser adicionado/atualizado.
 * @param id ID do vaga a ser atualizado.  O valor é 0 quando apenas quer adicionar.
 * @returns Objeto vaga se a operação for feita com sucesso, caso contrário retorno nada.
 */
function salvar(vaga: Vaga, id: number): Promise<Vaga> {

    const method = (id === 0 ? 'POST' : 'PUT');
    const urlRequest = (id === 0 ? API_URL + CONTROLLER : API_URL + CONTROLLER + id);

    return fetch(urlRequest, {
        method: method,
        body: JSON.stringify(vaga),
        headers: {
            'content-type': 'application/json',
            authorization: 'Bearer ' + localStorage.getItem('token-filmes')
        }
    })
        .then(() => {
            return vaga as any;
        })
        .catch(err => console.error(err));
}

/**
 * Deleta uma vaga.
 * @param id ID da vaga
 */
function deletar(id: number): void {
    fetch(API_URL + CONTROLLER, {
        method: 'DELETE',
        headers: {
            authorization: 'Bearer ' + localStorage.getItem(TOKEN_KEY)
        }
    })
        .then(response => response.json())
        .catch(err => console.error(err));
}

export default {listar, buscarPorEmpresa, buscarPorFiltro, buscarPorId, salvar, deletar}