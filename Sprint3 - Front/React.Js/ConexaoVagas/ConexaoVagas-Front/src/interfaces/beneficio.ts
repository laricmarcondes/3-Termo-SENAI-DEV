import { BeneficioVaga } from "./beneficioVaga";
import { Usuario } from "./usuario";

export interface Beneficio {
    idBeneficio: number;
    idCriadoPor: number | null;
    nomeBeneficio: string;
    idCriadoPorNavigation: Usuario;
    beneficioVaga: BeneficioVaga[];
}