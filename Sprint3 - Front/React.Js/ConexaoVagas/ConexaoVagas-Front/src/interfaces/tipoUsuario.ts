import { Usuario } from "./usuario";

export interface TipoUsuario {
    idTipoUsuario: number;
    nome: string;
    usuario: Usuario[];
}