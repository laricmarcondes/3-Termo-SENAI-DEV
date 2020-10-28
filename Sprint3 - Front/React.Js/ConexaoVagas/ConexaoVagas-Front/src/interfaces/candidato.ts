import { Candidatura } from "./candidatura";
import { Endereco } from "./endereco";
import { HabilidadeCandidato } from "./habilidadeCandidato";
import { StatusUsuario } from "./statusUsuario";
import { Usuario } from "./usuario";

export interface Candidato {
    idUsuario: number;
    idStatusUsuario: number;
    idEndereco: number | null;
    nome: string;
    sobrenome: string;
    curso: string;
    matricula: string;
    cpf: string;
    rg: string;
    cep: string;
    enderecoCandidato: string;
    numeroEndereco: number;
    telefoneCandidato: string;
    celularCandidato: string;
    dataNascimento: string;
    visualizacao: number;
    idEnderecoNavigation: Endereco;
    idStatusUsuarioNavigation: StatusUsuario;
    idUsuarioNavigation: Usuario;
    candidatura: Candidatura[];
    habilidadeCandidato: HabilidadeCandidato[];
}