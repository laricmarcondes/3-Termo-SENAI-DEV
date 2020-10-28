import { Beneficio } from "./beneficio";
import { CandidatoViewmodel } from "./candidatoViewmodel";
import { EmpresaViewmodel } from "./empresaViewmodel";
import { Habilidade } from "./habilidade";

export interface UsuarioViewmodel {
    idUsuario: number;
    idTipoUsuario: number;
    candidato: CandidatoViewmodel;
    empresa: EmpresaViewmodel;
    beneficio: Beneficio[];
    habilidade: Habilidade[];
}