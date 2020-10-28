import { Candidato } from "../interfaces/candidato";
import { CandidatoViewmodel } from "../interfaces/candidatoViewmodel";
import { API_URL, TOKEN_KEY } from "./apisettings";

// Define o controller de comunicação da API.
// A URL ficaria assim:
// http://localhost:5000/api/Candidato/
const CONTROLLER = "Candidato/";

/**
 * Lista os candidatos.
 */
function listar(): Promise<CandidatoViewmodel[]> {
    // http://localhost:5000/api/Candidato/
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
 * @param id ID do candidato
 * @returns O candidato buscado.
 */
function buscarPorId(id: number): Promise<CandidatoViewmodel> {
    // http://localhost:5000/api/Candidato/5
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
 * @param candidato Objeto candidato a ser adicionado/atualizado.
 * @param id ID do candidato a ser atualizado.  O valor é 0 quando apenas quer adicionar.
 * @returns Objeto candidato se a operação for feita com sucesso, caso contrário retorno nada.
 */
function salvar(candidato: Candidato, id: number): Promise<Candidato> {

    const method = (id === 0 ? 'POST' : 'PUT');
    const urlRequest = (id === 0 ? API_URL + CONTROLLER : API_URL + CONTROLLER + id);

    return fetch(urlRequest, {
        method: method,
        body: JSON.stringify(candidato),
        headers: {
            'content-type': 'application/json',
            authorization: 'Bearer ' + localStorage.getItem('token-filmes')
        }
    })
        .then(() => {
            return candidato as any;
        })
        .catch(err => console.error(err));
}

export default {listar, buscarPorId, salvar}