import { Candidato } from "./candidato";
import { Empresa } from "./empresa";

export interface StatusUsuario {
    idStatusUsuario: number;
    nomeStatus: string;
    candidato: Candidato[];
    empresa: Empresa[];
}