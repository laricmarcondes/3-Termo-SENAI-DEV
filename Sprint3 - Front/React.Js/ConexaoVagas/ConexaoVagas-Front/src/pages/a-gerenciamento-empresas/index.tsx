import React, { useEffect, useState } from 'react';
import Card from '../../components/card';
import imgLogo from '../../assets/imgs/logo-senai-principal.png';
import { Empresa } from '../../models/empresa';
import EmpresaApi from '../../api/empresa'
import NotificacaoApi from '../../api/notificacoes'
import Sidebar from '../../components/sidebar/Index';
import Loader from '../../components/loader';
import { StatusUsuario, TipoUsuario } from '../../utils/enums';
import { Link } from 'react-router-dom';
import Hamburguer from '../../components/hamburguer';

function AGerenciarEmpresas() {

    const [empresasPendentes, setEmpresasPendentes] = useState<Empresa[]>([]);
    const [empresas, setEmpresas] = useState<Empresa[]>([]);

    useEffect(() => {
        EmpresaApi.listarPorStatus(1).then(data => setEmpresasPendentes(data));
        EmpresaApi.listarPorStatus(2).then(data => setEmpresas(data));
    }, []);

    function recusarEmpresa(id: number) {
        if (window.confirm('Deseja recusar a empresa?')) {
            EmpresaApi.mudarStatus(id, StatusUsuario.BLOQUEADO);
            // NotificacaoApi.addNotificacao(`Empresa ${empresa.nomeFantasia} foi recusada.`);
            EmpresaApi.listarPorStatus(StatusUsuario.PENDENTE).then(data => setEmpresasPendentes(data));
            EmpresaApi.listarPorStatus(StatusUsuario.ATIVO).then(data => setEmpresas(data));
        }
    }

    function aceitarEmpresa(id: number) {
        if (window.confirm('Deseja aceitar a empresa?')) {
            EmpresaApi.mudarStatus(id, StatusUsuario.ATIVO);
            // NotificacaoApi.addNotificacao(`Empresa ${empresa.nomeFantasia} foi aceita.`);
            EmpresaApi.listarPorStatus(StatusUsuario.PENDENTE).then(data => setEmpresasPendentes(data));
            EmpresaApi.listarPorStatus(StatusUsuario.ATIVO).then(data => setEmpresas(data));
        }
    }

    function renderPendentes() {
        // Enquanto candidatos for vazio, 
        // retorne uma ícone de loading.
        if (empresasPendentes.length === 0) return (
            <p className="text-center p-5">Há nenhuma empresa pendente.</p>
        )

        return empresasPendentes.map((item: Empresa) => {
            return (
                
                    <Card className="flex flex-row justify-between items-center mb-5">
                        <div className="flex items-center">
                            <img className="h-12" src={item.foto} />
                            <p className="">{item.nomeFantasia}</p>
                        </div>
                        <div>
                            <a className="fa fa-check text-green-600 text-2xl p-2 cursor-pointer"
                                onClick={e => aceitarEmpresa(item.idUsuario!)}></a>
                            <a className="fa fa-times text-red-600 text-2xl p-2 cursor-pointer"
                                onClick={e => recusarEmpresa(item.idUsuario!)}></a>
                        </div>
                    </Card>
            )
        })
    }

    function renderEmpresas() {
        // Enquanto candidatos for vazio, 
        // retorne uma ícone de loading.
        if (empresas?.length === 0) return (
            <Loader className="mx-auto m-5" />
        )

        return empresas.map((item: Empresa) => {
            return (
                <Card className="flex flex-col mb-5" key={item.idUsuario}>
                    {/* Conteudo encima */}
                    <div className="flex flex-row pb-2">
                        <div className="flex items-center">
                            <img className="h-12" src={item.foto} />
                            <p className="flex items-center">{item.nomeFantasia}</p>
                        </div>
                    </div>
                    <hr />
                    {/* Conteudo debaixo */}
                    <div className="flex flex-row p-2 text-sm justify-between items-center">
                        <div className="flex flex-col w-1/2 pr-2">
                            <div>
                                <i className="ri-building-2-line text-lg" />
                                <span> {item.razaoSocial}</span>
                            </div>
                            <div>
                                <i className="ri-map-pin-line text-lg"></i>
                                <span> {item.idEnderecoNavigation?.localCompleto}</span>
                            </div>
                            <div>
                                <i className="ri-time-line text-lg"></i>
                                <span> Cadastrado desde {item.idUsuarioNavigation?.dataCadastrado}</span>
                            </div>
                        </div>

                        <Link to={`/empresa/resumo/${item.idUsuario}`}>
                            <a className="ri-file-text-line text-2xl flex justify-center"></a>
                            <a>Ver mais</a>
                        </Link>
                    </div>
                </Card>
            )
        })
    }

    return (
        <div className="body w-full">
            <Hamburguer className="md:hidden flex fixed"/>
            <Sidebar className="md:flex hidden" />
            <main className="w-full">
                <h1 className="p-10 md:text-2xl text-xl flex justify-center">Gerenciamento de empresas</h1>
                <div className="flex flex-col m-auto lg:w-2/3 w-full p-5">
                    {empresasPendentes.length > 0 && 
                    <form>
                        <h2 className="flex flex-row justify-center m-5 text-lg">Empresas Pendentes</h2>
                        <div className="flex flex-row justify-between">
                            <p className="">Solicitação</p>
                            <div className="flex">
                                <p className="pr-2">Aceitar</p>
                                <p>Recusar</p>
                            </div>
                        </div>
                        {renderPendentes()}
                    </form>
                    }
                    <h2 className="flex flex-row justify-center mb-10 text-lg">Empresas Cadastradas</h2>
                    {renderEmpresas()}
                </div>
            </main>
        </div>
    )
}

export default AGerenciarEmpresas;