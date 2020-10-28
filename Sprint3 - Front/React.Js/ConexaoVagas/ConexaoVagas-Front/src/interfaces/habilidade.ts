import { HabilidadeCandidato } from "./habilidadeCandidato";
import { HabilidadeVaga } from "./habilidadeVaga";
import { Usuario } from "./usuario";

export interface Habilidade {
    idHabilidade: number;
    idCriadoPor: number | null;
    nomeHabilidade: string;
    idCriadoPorNavigation: Usuario;
    habilidadeCandidato: HabilidadeCandidato[];
    habilidadeVaga: HabilidadeVaga[];
}