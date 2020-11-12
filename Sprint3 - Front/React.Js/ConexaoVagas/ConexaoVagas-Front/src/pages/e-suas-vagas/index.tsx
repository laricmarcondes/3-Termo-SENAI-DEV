import React, { useEffect, useState } from 'react';
import VagaApi from '../../api/vagas'
import Card from '../../components/card';
import { Vaga } from '../../models/vaga';
import Loader from '../../components/loader';
import Sidebar from '../../components/sidebar/Index';
import { Link } from 'react-router-dom';
import { Jwt } from '../../services/auth';
import Hamburguer from '../../components/hamburguer';

function ESuasVagas() {

    const [vagas, setVagas] = useState<Vaga[]>([]);

    useEffect(() => {
        VagaApi.listarPorEmpresa(Jwt().jti).then(data => setVagas(data))
    }, []);

    function renderVagas() {
        // Enquanto candidatos for vazio, 
        // retorne uma ícone de loading.
        if (vagas === undefined) return (
            <Loader className="mx-auto m-5" />
        )

        return vagas.map((item: Vaga) => {
            return (
                <Link className="cursor-pointer" to={{
                    pathname: "/Empresa/visualizar-vaga",
                    state: item
                }}>
                    <Card className="flex flex-col h-full" key={item.idVaga}>
                        <div className="flex flex-row  items-center  pb-2">
                            <div className="bg-white border-2 border-primary-color  h-12 w-12 rounded-full ">
                                <p className="text-center pt-3 m-auto text-primary-color font-bold">{item.candidatura?.length}</p>
                            </div>
                            <h2 className="text-primary-color pl-2 font-bold">Candidatos</h2>
                        </div>
                        <hr></hr>
                        <div className="pt-2 pb-1">
                            <h2 className=''>{item.titulo}</h2>
                        </div>
                        <div className="text-sm">
                            <p><i className="ri-map-pin-line"></i>{item.idEnderecoNavigation?.localCompleto}</p>
                            <p><i className="ri-money-dollar-circle-line"></i> R${item.salario}</p>
                            <p><i className="ri-time-line"></i> {item.dataCriado}</p>
                        </div>
                    </Card>
                </Link>
            )
        })
    }

    return (
        <div className="body w-full">
            <Hamburguer className="md:hidden flex fixed" />
            <Sidebar className="md:flex hidden"></Sidebar>
            <main className='w-full m-5'>
                <div className="lg:w-2/3 w-full m-auto">
                <h1 className="p-10 md:text-2xl text-xl flex justify-center">Suas Vagas</h1>
                    {vagas.length == 0 &&
                        <div className="text-center">
                            <h2 className="text-left inline-block">Parece que você ainda não anunciou nenhuma vaga.
                            <Link to="cadastrar-vagas"
                                        // &nbsp; serve para adicionar um espaço uma letra vazia.
                                        className="text-primary-color font-bold">&nbsp;Crie uma agora.</Link></h2>
                        </div>}
                    <div className="grid lg:grid-cols-3 md:grid-cols-2 grid-cols-1 gap-4 p-5">
                        {renderVagas()}
                    </div>
                </div>
            </main>
        </div>
    )
}

export default ESuasVagas