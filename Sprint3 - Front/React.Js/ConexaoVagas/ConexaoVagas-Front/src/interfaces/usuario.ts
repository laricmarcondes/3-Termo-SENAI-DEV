import { Administrador } from "./administrador";
import { Beneficio } from "./beneficio";
import { Candidato } from "./candidato";
import { Empresa } from "./empresa";
import { Habilidade } from "./habilidade";
import { TipoUsuario } from "./tipoUsuario";

export interface Usuario {
    idUsuario: number;
    idTipoUsuario: number;
    email: string;
    senha: string;
    dataCadastrado: string | null;
    idTipoUsuarioNavigation: TipoUsuario;
    administrador: Administrador;
    candidato: Candidato;
    empresa: Empresa;
    beneficio: Beneficio[];
    habilidade: Habilidade[];
}