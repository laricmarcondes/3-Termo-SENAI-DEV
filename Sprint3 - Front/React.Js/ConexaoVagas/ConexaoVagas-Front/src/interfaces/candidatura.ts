import { Candidato } from "./candidato";
import { Vaga } from "./vaga";

export interface Candidatura {
    idCandidatura: number;
    idCandidato: number;
    idVaga: number;
    curriculo: string;
    visualizado: boolean;
    dataCriado: string;
    idCandidatoNavigation: Candidato;
    idVagaNavigation: Vaga;
}