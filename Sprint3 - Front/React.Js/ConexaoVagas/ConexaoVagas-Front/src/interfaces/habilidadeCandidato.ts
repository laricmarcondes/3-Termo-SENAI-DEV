import { Candidato } from "./candidato";
import { Habilidade } from "./habilidade";

export interface HabilidadeCandidato {
    idHabilidadeCandidato: number;
    idHabilidade: number;
    idCandidato: number;
    idCandidatoNavigation: Candidato;
    idHabilidadeNavigation: Habilidade;
}