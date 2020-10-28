import React, { useEffect, useState } from 'react';
import Card from '../../components/card/index';
import CandidatoApi from '../../api/candidatos'
import { CandidatoViewmodel } from '../../interfaces/candidatoViewmodel';
import Sidebar from '../../components/sidebar/Index';

function AListaCandidato() {
    const [candidatos, setCandidatos] = useState<CandidatoViewmodel[]>();

    useEffect(() => {
        CandidatoApi.listar().then(data => setCandidatos(data))
    }, []);

    function renderCandidatos() {
        // Enquanto candidatos for vazio, 
        // retorne uma mensagem de "Carregando..."
        if (candidatos === undefined) return (
            <p className="flex justify-center">Carregando...</p>
        )

        return candidatos.map((item: CandidatoViewmodel) => {
            return(
                <div key={item.idUsuario}>
                    <Card className="flex flex-row flex-1 items-center">
                        <i className="ri-user-line text-2xl md:w-20 w-8"></i>
                        <div className="flex-1">{item.nome}</div>
                        <div className="flex-1">{item.curso}</div>
                        {/* TODO: Incluir dataCadastrado no CandidatoViewmodel */}
                        <div className="flex-1">11/11/2020</div>
                        <i className="ri-file-text-line text-2xl"></i>
                    </Card>
                </div>
            )
        })
    }

    return (
        <div className="body w-full">
            <Sidebar className="md:flex hidden"></Sidebar>
            <main className="w-full">
                <h1 className="p-10 pb-16 md:text-2xl text-md flex justify-center">Gerenciamento de candidatos</h1>

                {/* Lista */}
                <div className="lg:w-2/3 m-auto md:text-md text-xs">
                    <div className="flex flex-row justify-between mr-2 font-medium">
                        <div className="md:w-32 w-20"> </div>
                        <div className="flex-1">Nome do candidato</div>
                        <div className="flex-1">Área</div>
                        <div className="flex-1">Data de inscrição</div>
                        <div>Detalhes</div>
                    </div>

                    <Card className="flex flex-row justify-between flex-1 items-center">
                        <i className="ri-user-line text-2xl md:w-20 w-8"></i>
                        <div className="flex-1">Larissa Carvalho</div>
                        <div className="flex-1">Desenvolvedor de sistemas</div>
                        <div className="flex-1">11/11/2020</div>
                        <i className="ri-file-text-line text-2xl"></i>
                    </Card>
                    {renderCandidatos()}
                </div>

            </main>
        </div>
    );
}

export default AListaCandidato;