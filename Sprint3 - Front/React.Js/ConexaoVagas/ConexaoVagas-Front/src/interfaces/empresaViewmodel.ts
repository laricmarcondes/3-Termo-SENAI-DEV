import { Vaga } from "./vaga";

export interface EmpresaViewmodel {
    idUsuario: number;
    foto: string;
    razaoSocial: string;
    telefoneEmpresa: string;
    celularEmpresa: string;
    email: string;
    cep: string;
    endereco: string;
    numero: number;
    visualizacao: number;
    vaga: Vaga[];
}