import React, { useEffect, useState } from 'react';
import Sidebar from '../../components/sidebar/Index';
import Card from '../../components/card/index';
import Button from '../../components/button/index';
import VagaApi from '../../api/vagas';
import EmpresaApi from '../../api/empresa';
import { Vaga } from '../../models/vaga';
import { Empresa } from '../../models/empresa';
import Loader from '../../components/loader';
import { HabilidadeVaga } from '../../models/habilidadeVaga';
import { Link } from 'react-router-dom';
import Hamburguer from '../../components/hamburguer';

function AEmpresaGeral({ match }: any) {

    const {
        params: { id },
    } = match;

    const [vagas, setVagas] = useState<Vaga[]>();
    const [empresa, setEmpresa] = useState<Empresa>(new Empresa());

    useEffect(() => {
        VagaApi.listarPorEmpresa(id).then(data => setVagas(data))
        EmpresaApi.buscarPorId(id).then(data => setEmpresa(data))
    }, []);

    function renderVagas() {
        // Enquanto vagas for vazio, 
        // retorne uma mensagem de "Carregando..."
        if (vagas === undefined) return (
            <Loader className="mx-auto m-5" />
        )

        return vagas.map((item: Vaga) => {
            return (
                <Link to={`/vaga/${item.idVaga}`}>
                    <Card className="flex flex-col mb-5" key={item.idVaga}>
                        {/* Conteudo encima */}
                        <div className="flex flex-row p-2">
                            <p className="flex items-center">{item.titulo}</p>
                        </div>
                        <hr />
                        {/* Conteudo debaixo */}
                        <div className="flex flex-row pb-2 text-sm">
                            <div className="flex flex-col w-1/2 pr-2">
                                <div>
                                    <i className="ri-money-dollar-circle-line text-lg" />
                                    <span> R$ {item.salario}</span>
                                </div>
                                <div>
                                    <i className="ri-map-pin-line text-lg"></i>
                                    <span> {item.idEnderecoNavigation?.localCompleto}</span>
                                </div>
                                <div>
                                    <i className="ri-time-line text-lg"></i>
                                    <span> Expira em {item.dataExpiracao}</span>
                                </div>
                            </div>
                            <div className="w-1/2 flex flex-row flex-wrap md:text-base text-xs">
                                {item.habilidadeVaga?.map((h: HabilidadeVaga) => {
                                    return (
                                        <a className="bg-gray-400 px-1 rounded-full m-1 h-8 flex items-center">{h.idHabilidadeNavigation?.nomeHabilidade}</a>
                                    )
                                })}
                            </div>
                        </div>
                    </Card>
                </Link>
            )
        })
    }

    return (
        <div className="body w-full">
            <Hamburguer className="md:hidden flex fixed"/>
            <Sidebar className="md:flex hidden"></Sidebar>
            <main className="w-full">
                <div className="pl-8 pt-4 pb-6 bg-cv-gray">
                    <div className="flex flex-row justify-center">
                        <div className="pr-12">
                            <div id="img" className="w-64 h-64 bg-gray-200 rounded-md border-2"> </div>
                        </div>
                        <div>
                            <h2 className="text-4xl">{empresa?.nomeFantasia}</h2>
                            <p className="text-2xl">Cadastrada desde {empresa?.idUsuarioNavigation?.dataCadastrado}</p>
                            <p id="descricaoVaga" className="pb-6"></p>
                            <i className="ri-mail-line"><span>Email de contato</span></i>
                            <div className="pb-3">{empresa?.idUsuarioNavigation?.email}</div>
                            <div className="flex flex-row">
                                <div>
                                    <i className="ri-phone-fill"><span>Telefone</span></i>
                                    <div>{empresa?.telefoneEmpresa}</div>
                                </div>

                                <div className="pl-20 pt-5">
                                    <Link to={`/empresa/detalhes/${empresa.idUsuario}`}>
                                        <Button className="flex items-center text-md">
                                            <i className="ri-building-4-line text-lg px-1"></i>
                                            <p>Visualização da empresa</p>
                                        </Button>
                                    </Link>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <h1 className="text-2xl text-center mt-10 mb-5">Vagas disponíveis</h1>
                <div className="lg:w-2/3 m-auto p-5">
                    {renderVagas()}
                </div>

                <div className="flex justify-center pb-10">
                    <Link to="/Administrador/gerenciamento-empresas">
                        <Button>
                            <p>Voltar</p>
                        </Button>
                    </Link>

                </div>
            </main>
        </div>
    )
}

export default AEmpresaGeral;