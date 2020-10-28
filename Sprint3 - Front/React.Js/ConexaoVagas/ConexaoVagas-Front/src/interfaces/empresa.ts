import { StatusUsuario } from "./statusUsuario";
import { Usuario } from "./usuario";
import { Vaga } from "./vaga";

export interface Empresa {
    idUsuario: number;
    idStatusUsuario: number;
    foto: string;
    cnae: string;
    cnpj: string;
    razaoSocial: string;
    telefoneEmpresa: string;
    celularEmpresa: string;
    cep: string;
    endereco: string;
    numero: number;
    visualizacao: number;
    idStatusUsuarioNavigation: StatusUsuario;
    idUsuarioNavigation: Usuario;
    vaga: Vaga[];
}