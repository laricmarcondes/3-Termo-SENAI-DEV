import React, { useEffect, useState } from 'react';
import Card from '../../components/card/index';
import { Candidatura } from '../../models/candidatura';
import Loader from '../../components/loader';
import { Vaga } from '../../models/vaga';
import Sidebar from '../../components/sidebar/Index';
import Hamburguer from '../../components/hamburguer';
import { useLocation } from 'react-router-dom';
import { Matching } from '../../models/matching';
import MatchesApi from '../../api/matching'
import CandidatosApi from '../../api/candidatos'
import { Candidato } from '../../models/candidato';

function EVisualizarVagas() {

    const location: any = useLocation();

    const [candidatos, setCandidatos] = useState<Candidato[]>([])
    const [matches, setMatches] = useState<Matching[]>([]);
    const [vaga, setVagas] = useState<Vaga>(new Vaga());


    useEffect(() => {
        setVagas(location.state);
        MatchesApi.listar().then(data => setMatches(data));
        CandidatosApi.listar().then(data => setCandidatos(data))
    }, []);

    function renderCandidatura() {
        if (vaga.candidatura === undefined) return (
            <Loader className="m-auto" />
        )

        return vaga.candidatura.map((item: Candidatura) => {
            return (
                <Card key={item.idVaga} className="flex flex-row mb-5 justify-between">
                    <div className="flex items-center">
                        <div className="bg-white border-2 border-primary-color h-12 w-12 rounded-full ">
                            <p className="text-center pt-3 m-auto text-primary-color font-bold">{Math.round(matches
                                .find(match => (match.idVaga == item.idVaga) && (match.idCandidato == item.idCandidato))?.porcentagem as number || 0)}%</p>
                        </div>
                        <div className="pl-2">{candidatos.find((c: Candidato) => c.idUsuario == item.idCandidato)?.nome}</div>
                    </div>
                    <div>
                        <a className="ri-file-text-line text-2xl flex justify-center"></a>
                        <a>Ver currículo</a>
                    </div>
                </Card>
            )
        })
    }


    return (
        <div className='body w-full'>
            <Hamburguer className="md:hidden flex fixed" />
            <Sidebar className="md:flex hidden"></Sidebar>
            <main className="w-full">
                <div className="pl-8 pt-4 pb-6 w-full bg-cv-gray">
                    <div className="flex flex-row justify-center">
                        <div className="pr-12">
                            <div id="img" className="w-64 h-64 bg-gray-200 rounded-md border-2"> </div>
                        </div>
                        <div>
                            <h2 className="text-4xl"{...vaga?.titulo}></h2>
                            <p className="text-2xl">{vaga?.idEmpresaNavigation?.nomeFantasia}</p>
                            <p className="pb-6">{vaga?.descricao}</p>
                            <div>
                                <i className="ri-map-pin-line"><span>{vaga?.idEnderecoNavigation?.localCompleto}</span></i>
                                <div className="flex">
                                    <i className="ri-money-dollar-circle-line"><span>R$ {vaga?.salario},00</span></i>
                                    <i className='ri-time-line pl-10'><span>{vaga?.cargaHoraria}h</span></i>
                                </div>
                            </div>

                            <div className="block mt-8 flex items-center">
                                <p className="block bg-primary-color text-white p-3">{vaga.candidatura?.length || 0} Candidaturas</p>
                            </div>
                        </div>
                    </div>
                </div>

                <h1 className="p-10 md:text-2xl text-xl text-center">Candidaturas</h1>

                <div className="lg:w-2/3 w-full m-auto md:text-base text-sm px-5">
                    <div className="justify-between">
                        <div className="flex flex-row font-medium m-2">
                            <p className="flex">% de Match</p>
                            <p className="flex pl-10">Candidato</p>
                        </div>
                    </div>
                    {renderCandidatura()}
                </div>
            </main>
        </div>
    );
}
export default EVisualizarVagas; 