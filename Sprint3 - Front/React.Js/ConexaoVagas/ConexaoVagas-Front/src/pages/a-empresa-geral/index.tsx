import React, { useEffect, useState } from 'react';
import Sidebar from '../../components/sidebar/Index';
import Card from '../../components/card/index';
import Button from '../../components/button/index';
import VagaApi from '../../api/vagas';
import EmpresaApi from '../../api/empresa';
import { Vaga } from '../../interfaces/vaga';
import { EmpresaViewmodel } from '../../interfaces/empresaViewmodel';

function AEmpresaGeral() {

    const [vagas, setVagas] = useState<Vaga[]>();
    const [empresa, setEmpresa] = useState<EmpresaViewmodel>();

    useEffect(() => {
        VagaApi.listar().then(data => setVagas(data))
        EmpresaApi.buscarPorId().then(data => setEmpresa(data))
    }, []);

    function renderVagas() {
        // Enquanto vagas for vazio, 
        // retorne uma mensagem de "Carregando..."
        if (vagas === undefined) return (
            <p className="flex justify-center">Carregando...</p>
        )

        return vagas.map((item: Vaga) => {
            return (
                <div key={item.idVaga}>

                    <div className="pl-8 pt-4 pb-6 bg-gray-100">

                        <div className="flex flex-row justify-center">F
                            <div className="pr-12">
                                <div id="img"> </div>
                            </div>

                            <div>
                            <h1 className="text-4xl">{item.empresa.razaoSocial}</h1>

                            <p className="text-2xl">Cadastrada desde {item.usuario.dataCadastrado}</p>

                            <p>{item.empresa.descricao}</p>

                                <p className="ri-mail-line">Email de contato</p>
                                {item.usuario.email}

                                <div className="flex flex-row">
                                    <div>
                                        <p className="ri-phone-fill">Telefone</p>
                                        {item.empresa.telefoneEmpresa}
                                    </div>

                                    <div className=" pl-64">
                                        <Button className="ri-building-line" name="Detalhes da Empresa" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    {/* <Card className="flex flex-row justify-between">
                        <div>{item.titulo}</div>
                        <div>{item.endereco}</div>
                        <div>{item.dataExpiracao}</div>
                        <div>{item.salario}</div>
                    </Card> */}
                </div >
            )
        })
    }

    return (
        <div className="body w-full">
            <Sidebar className="md:flex hidden"></Sidebar>
            <main className="w-full">

                <div className="pl-8 pt-4 pb-6 bg-gray-100">

                    <div className="flex flex-row justify-center">

                        <div className="pr-12">
                            <div id="img" className="w-64 h-64 bg-gray-200 rounded-md border-2"> </div>
                        </div>

                        <div>
                            <h1 className="text-4xl">Microsoft</h1>

                            <p className="text-2xl">Cadastrada desde 11/11/2020</p>

                            <p className="pb-6">Finge que tem uma descrição aqui</p>

                            <p className="ri-mail-line">Email de contato</p>
                            <div className="pb-3">email@gmail.com</div>

                            <div className="flex flex-row">
                                <div>

                                    <p className="ri-phone-fill">Telefone</p>
                                    <div>11 2345-6789</div>
                                </div>

                                <div className=" pl-64">
                                    <Button className="ri-building-line" name="Detalhes da Empresa" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div>
                    <div className="flex flex-row justify-between font-medium pt-10">
                        <div className="pl-56">Nome da vaga</div>
                        <div className="pl-12">Localização</div>
                        <div className="">Data de expiração</div>
                        <div className=" pr-56">Salário</div>
                    </div>

                    <div className="pl-40 pr-40">
                        <Card className="flex flex-row justify-between">
                            <div>Programador c# Junior</div>
                            <div>São Paulo, SP</div>
                            <div>11/11/2020</div>
                            <div>R$ 1.200,00</div>
                        </Card>
                    </div>
                    {renderVagas()}
                </div>
                <div className="flex justify-center">
                    <Button name="Voltar" />
                </div>
            </main>
        </div>
    )
}

export default AEmpresaGeral;