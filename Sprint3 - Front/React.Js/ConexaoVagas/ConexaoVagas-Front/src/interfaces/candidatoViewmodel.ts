import { HabilidadeCandidato } from "./habilidadeCandidato";

export interface CandidatoViewmodel {
    idUsuario: number;
    curso: string;
    nome: string;
    sobrenome: string;
    enderecoCandidato: string;
    cep: string;
    numeroEndereco: number;
    dataNascimento: string;
    visualizacao: number;
    habilidadeCandidato: HabilidadeCandidato[];
}