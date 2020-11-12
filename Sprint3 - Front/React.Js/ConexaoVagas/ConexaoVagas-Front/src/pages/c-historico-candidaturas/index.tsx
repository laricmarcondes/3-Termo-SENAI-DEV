import React, { useEffect, useState } from 'react';
import Card from '../../components/card/index';
import CandidatoApi from '../../api/candidatos'
import Senai from '../../assets/imgs/logo-senai-principal.png'
import Sidebar from '../../components/sidebar/Index';
import Loader from '../../components/loader';
import { Candidato } from '../../models/candidato';
import { Candidatura } from '../../models/candidatura';
import Hamburguer from '../../components/hamburguer';
import { Jwt } from '../../services/auth';

function CHistoricoCandidaturas() {
    const [candidato, setCandidato] = useState<Candidato>();

    useEffect(() => {
        CandidatoApi.buscarPorId(Jwt().jti).then(data => setCandidato(data))
    }, []);

    function renderCandidaturas() {
        // Enquanto candidatos for vazio, 
        // retorne uma ícone de loading.
        if (candidato === undefined) return (
            <Loader className="mx-auto m-5" />
        )

        return candidato.candidatura?.map((item: Candidatura) => {
            return (
                <Card className="flex flex-col mb-5" key={item.idCandidatura}>
                    {/* Conteudo encima */}
                    <div className="flex flex-row pb-2">
                        <div className="pr-2">
                            <img className="w-16 h-16 object-contain" src={Senai}></img>
                        </div>
                        <p className="flex items-center">{item.idVagaNavigation?.titulo}</p>
                    </div>
                    <hr />
                    {/* Conteudo debaixo */}
                    <div className="flex flex-row p-2 text-sm justify-between items-center">
                        <div className="flex flex-col w-1/2 pr-2">
                            <div>
                                <i className="ri-money-dollar-circle-line text-lg" />
                                <span> R$ {item.idVagaNavigation?.salario}</span>
                            </div>
                            <div>
                                <i className="ri-map-pin-line text-lg"></i>
                                <span> {item.idVagaNavigation?.idEnderecoNavigation?.localCompleto}</span>
                            </div>
                            <div>
                                <i className="ri-time-line text-lg"></i>
                                <span> Inscrito em {item.dataCriado}</span>
                            </div>
                        </div>
                        <div>
                            <a className="ri-file-text-line text-2xl flex justify-center"></a>
                            <a>Ver currículo</a>
                        </div>
                    </div>
                </Card>
            )
        })
    }

    return (
        <div className="body w-full">
            <Hamburguer className="md:hidden flex fixed"/>
            <Sidebar className="md:flex hidden"></Sidebar>
            <main className="w-full">
                <h1 className="p-10 md:text-2xl text-xl flex justify-center">Histórico de Candidaturas</h1>
                <div className="lg:w-2/3 p-5 m-auto md:text-base text-sm">
                    {renderCandidaturas()}
                </div>
            </main>
        </div>
    );
}

export default CHistoricoCandidaturas;