import React, { useEffect, useState } from 'react';
import Card from '../../components/card/index';
import CandidatoApi from '../../api/candidatos'
import MatchesApi from '../../api/matching'
import Sidebar from '../../components/sidebar/Index';
import Loader from '../../components/loader';
import { Candidato } from '../../models/candidato';
import { Link } from 'react-router-dom';
import Hamburguer from '../../components/hamburguer';

function AListaCandidato() {
    const [candidatos, setCandidatos] = useState<Candidato[]>([]);

    useEffect(() => {
        CandidatoApi.listar().then(data => setCandidatos(data))
    }, []);

    function renderCandidatos() {
        // Enquanto candidatos for vazio, 
        // retorne uma ícone de loading.
        if (candidatos === undefined) return (
            <Loader className="mx-auto m-5" />
        )

        return candidatos.map((item: Candidato) => {
            return (

                <Card className="flex flex-col mb-5" key={item.idUsuario}>
                    {/* Conteudo encima */}
                    <div className="flex flex-row pb-2">
                        <div className="pr-2">
                            {/* <img className="w-16 h-16 object-contain" src={Senai}></img> */}
                            <i className="ri-user-line text-2xl"></i>
                        </div>
                        <p className="flex items-center">{item.nome}</p>
                    </div>
                    <hr />
                    {/* Conteudo debaixo */}
                    <div className="flex flex-row p-2 text-sm justify-between items-center">
                        <div className="flex flex-col w-1/2 pr-2">
                            <div>
                                <i className="ri-profile-line text-lg" />
                                <span> Cursando {item.curso}</span>
                            </div>
                            <div>
                                <i className="ri-map-pin-line text-lg"></i>
                                <span> {item.idEnderecoNavigation?.localCompleto}</span>
                            </div>
                            <div>
                                <i className="ri-time-line text-lg"></i>
                                <span> Inscrito em {item.idUsuarioNavigation?.dataCadastrado}</span>
                            </div>
                        </div>
                        <div>
                            <Link to={`/candidato/detalhes/${item.idUsuario}`}>
                                <a className="ri-file-text-line text-2xl flex justify-center"></a>
                                <a>Ver Perfil</a>
                            </Link>
                        </div>
                    </div>
                </Card>
            )
        })
    }

    return (
        <div className="body w-full">
            <Hamburguer className="md:hidden flex fixed" />
            <Sidebar className="md:flex hidden"></Sidebar>
            <main className="w-full">
                <h1 className="p-10 md:text-2xl text-xl flex justify-center">Gerenciamento de candidatos</h1>
                <div className="lg:w-2/3 m-auto p-5 md:text-base text-sm">
                    {renderCandidatos()}
                </div>

            </main>
        </div>
    );
}

export default AListaCandidato;