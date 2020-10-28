import { Habilidade } from "./habilidade";
import { Vaga } from "./vaga";

export interface HabilidadeVaga {
    idHabilidadeVaga: number;
    idHabilidade: number;
    idVaga: number;
    idHabilidadeNavigation: Habilidade;
    idVagaNavigation: Vaga;
}