import { BeneficioVaga } from "./beneficioVaga";
import { Candidatura } from "./candidatura";
import { Empresa } from "./empresa";
import { Endereco } from "./endereco";
import { HabilidadeVaga } from "./habilidadeVaga";

export interface Vaga {
    idVaga: number;
    idEmpresa: number;
    idEndereco: number | null;
    titulo: string;
    salario: number;
    local: string;
    cep: string;
    qualificacao: string;
    dataCriado: string;
    dataExpiracao: string;
    cargaHoraria: number;
    descricao: string;
    visualizacao: number;
    idEmpresaNavigation: Empresa;
    idEnderecoNavigation: Endereco;
    beneficioVaga: BeneficioVaga[];
    candidatura: Candidatura[];
    habilidadeVaga: HabilidadeVaga[];
}