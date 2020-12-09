/* eslint-disable eqeqeq */
import React, { useEffect, useState } from 'react';
import ButtonForm from '../../components/buttonForm';
import Input from '../../components/input';
import Senai from '../../assets/imgs/logo-senai-principal.png';
import Logo from '../../assets/imgs/logo-dark.png';
import Button from '../../components/button';
import EmpresaApi from '../../api/empresa';
import NotificacaoApi from '../../api/notificacoes';
import { Empresa } from '../../models/empresa';
import { Link, useHistory, useLocation } from 'react-router-dom';
import { useAlert } from 'react-alert';

function CadastroDadosEmpresa() {

    const alert = useAlert();

    const [empresa, setEmpresa] = useState<Empresa>(new Empresa());

    const location = useLocation<any>();
    let history = useHistory();

    useEffect(() => {
        setEmpresa({ ...empresa, idUsuarioNavigation: { email: location.state.email, senha: location.state.senha } })
    }, []);

    function salvar() {
        if (empresa != undefined) {
            EmpresaApi.salvar(empresa, 0).then(data => {
                if (data != null || data != undefined) {
                    alert.success("Cadastrado com sucesso.")
                    history.push("/login")
                    NotificacaoApi.addNotificacao(`Empresa ${empresa.nomeFantasia} se cadastrou.`)
                }
            });
        } else {
            alert.error("Campos não preenchidos.")
        }
    }

    return (
        <div className="fundo w-full flex ">
            <div className="flex flex-col justify-between items-center">
                <img src={Senai} alt="" className="w-14 h-12 mt-4" />
                <div className="">
                    <p className="escrito tracking-wider font-bold"><i> Sua conexão</i></p>
                    <p className="escrito tracking-wider font-bold"><i> com empresas</i></p>
                    <p className="escrito tracking-wider font-bold"><i> começa agora.</i></p>
                </div>
                <img src={Logo} alt="" className="w-2/5 " />
            </div>
            <div className="login flex bg-white w-full h-full">
                <div className="login flex flex-col w-full m-16 mt-20">
                    <h1 className="font-bold text-4xl">Crie sua conta</h1>

                    <form onSubmit={event => {
                        event.preventDefault()
                        salvar()
                    }}>
                        <div className="flex flex-col justify-between mt-8">
                            <Input mask="" type="name" name="NomeFicticio" label="Nome ficticio:" placeholder="Olx"
                                className="input" required
                                onChange={e => setEmpresa({ ...empresa, nomeFantasia: e.target.value })}
                                value={empresa?.nomeFantasia!}></Input>

                            <Input mask="" type="name" name="RazaoSocial" label="Razão social:" placeholder="bom negócio atividades de internet"
                                className="input mt-2" required
                                onChange={e => setEmpresa({ ...empresa, razaoSocial: e.target.value })}
                                value={empresa.razaoSocial}></Input>

                            <div>
                                <p className="font-bold mt-2">Descrição</p>
                                <div className="rounded-md border-2 border-gray-400 w-64 hover:border-gray-500 w-full">
                                    <textarea className="bg-white focus:bg-gray-100 border-0 
                                                focus:outline-none w-full py-2 px-2 
                                                appearance-none"
                                        onChange={e => setEmpresa({ ...empresa, descricao: e.target.value })} required>
                                    </textarea>
                                </div>
                            </div>

                            <div className="flex justify-between mt-2">
                                <Input mask="99.999.999/9999-99" name="Cnpj" label="CNPJ:" placeholder="12.345.678/0009-12" className="input"
                                    onChange={e => setEmpresa({ ...empresa, cnpj: e.target.value })}
                                    value={empresa.cnpj}></Input>

                                <Input mask="9999-9" name="CNAE" label="CNAE:" placeholder="2543-8" className="input ml-2"
                                    onChange={e => setEmpresa({ ...empresa, cnae: e.target.value })}
                                    value={empresa.cnae}></Input>
                            </div>

                            <div className="flex justify-between mt-2">
                                <Input mask="99999-999" type="text" name="cep" label="CEP:" placeholder="Av. Paulista" className="input" required
                                    onChange={e => setEmpresa({ ...empresa, idEnderecoNavigation: { cep: e.target.value } })}
                                    value={empresa.idEnderecoNavigation?.cep}></Input>
                            </div>

                            <div className="flex justify-between mt-2">
                                <Input mask="(99)99999-9999" type="tel" name="Telefone" label="Telefone:" placeholder="(11)22222-222" className="input" required
                                    onChange={e => setEmpresa({ ...empresa, telefoneEmpresa: e.target.value })}
                                    value={empresa.telefoneEmpresa}></Input>

                                <Input mask="(99)99999-9999" type="tel" name="Celular" label="Celular:" placeholder="(11)99999-9999" className="input ml-2" required
                                    onChange={e => setEmpresa({ ...empresa, celularEmpresa: e.target.value })}
                                    value={empresa.celularEmpresa}></Input>
                            </div>

                            <div className="flex justify-between">
                                <Link to="/cadastro"><Button name="Voltar" ghost={true}>Voltar</Button></Link>
                                <ButtonForm className=" mt-6" name="Login"></ButtonForm>
                            </div>

                        </div>
                    </form>
                </div>
            </div>
        </div>
    )
}

export default CadastroDadosEmpresa