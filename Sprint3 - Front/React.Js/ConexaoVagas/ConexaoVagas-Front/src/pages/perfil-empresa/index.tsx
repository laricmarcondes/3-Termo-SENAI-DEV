import React, { useEffect, useState } from 'react';
import Button from '../../components/button/index';
import EmpresaApi from '../../api/empresa'
import { Empresa } from '../../models/empresa';
import Sidebar from '../../components/sidebar/Index';
import { TOKEN_KEY } from '../../api/apisettings';
import { Jwt } from '../../services/auth';
import { TipoUsuario } from '../../models/tipoUsuario';
import { Link } from 'react-router-dom';
import Hamburguer from '../../components/hamburguer';

function PerfilEmpresa({ match }: any) {

    const {
        params: { id },
    } = match;

    const [empresa, setEmpresa] = useState<Empresa>(new Empresa());

    EmpresaApi.buscarPorId(id).then(data => setEmpresa(data))
    useEffect(() => {

    }, []);

    const RenderButton = () => {

        if (Jwt().Role === 1) {
            return (
                <div className="flex flex-col items-center">
                    <Button name="Bloquear Perfil">Bloquear Perfil</Button>
                    <Button name="Voltar">Voltar</Button>
                </div>
            );
        }
        else if (Jwt().Role === 2) {
            return (
                <div className="flex flex-col items-center">
                    <Link to="/Empresa/perfil"><Button name="editar ">Concluir</Button>
                        <Link to="/Empresa/perfil"></Link><Button name="voltar">Voltar</Button></Link>
                </div>
            );
        }
    }



    return (
        <div className="body w-full">
            <Hamburguer className="md:hidden flex fixed"/>
            <Sidebar className="md:flex hidden" />
            <main className="w-full m-5">
                <h1 className="p-10 md:text-2xl text-xl flex justify-center">Visualização da empresa</h1>

                <div className="flex flex-col m-auto md:w-3/5 w-full">

                    <div className="w-full flex flex-col">
                        <div className="grid md:grid-cols-2 grid-cols-1">
                            
                            {/* Coluna Esquerda */}
                            <div className="flex flex-col">
                                <div className="mb-8">
                                    <p className="font-bold">Email:</p>
                                    <p>{empresa?.idUsuarioNavigation?.email}</p>
                                </div>

                                <div className="mb-8">
                                    <p className="font-bold">Nome:</p>
                                    <p>{empresa?.razaoSocial}</p>
                                </div>

                                <div className="mb-8">
                                    <p className="font-bold">Telefone:</p>
                                    <p>{empresa?.telefoneEmpresa}</p>
                                </div>

                                <div className="mb-8">
                                    <p className="font-bold">Endereço:</p>
                                    <p className="pr-8">{empresa?.idEnderecoNavigation?.localCompleto}</p>
                                </div>

                                <div className="mb-8">
                                    <p className="font-bold">Descrição:</p>
                                    <p>{empresa?.descricao}</p>
                                </div>
                            </div>

                            {/* Coluna Direita */}
                            <div className="flex flex-col">
                                <div className="mb-8">
                                    <p className="font-bold">Razão Social:</p>
                                    <p>{empresa?.razaoSocial}</p>
                                </div>

                                <div className="mb-8">
                                    <p className="font-bold">Endereço:</p>
                                    <p>{empresa?.idEnderecoNavigation?.localCompleto}</p>
                                </div>

                                <div className="mb-8">
                                    <p className="font-bold">CNPJ:</p>
                                    <p>{empresa?.cnpj}</p>
                                </div>

                                <div className="mb-8">
                                    <p className="font-bold">CNAE:</p>
                                    <p>{empresa?.cnae}</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="flex flex-col items-center justify-center pt-6">
                        <div className="pb-5">
                            <Button name="Bloquear Perfil">Bloquear Perfil</Button>
                        </div>

                        <div>
                            <Link to={`/empresa/resumo/${id}`}>
                                <Button name="Voltar">Voltar</Button>
                            </Link>
                        </div>
                    </div>
                </div>
                {RenderButton()}
            </main>
        </div>
    );

}

export default PerfilEmpresa;