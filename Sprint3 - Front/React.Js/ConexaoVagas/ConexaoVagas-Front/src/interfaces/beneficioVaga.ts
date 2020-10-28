import { Beneficio } from "./beneficio";
import { Vaga } from "./vaga";

export interface BeneficioVaga {
    idBeneficioVaga: number;
    idBeneficio: number;
    idVaga: number;
    idBeneficioNavigation: Beneficio;
    idVagaNavigation: Vaga;
}