/* eslint-disable eqeqeq */
import React, { useEffect, useState } from 'react';
import ButtonForm from '../../components/buttonForm';
import Input from '../../components/input';
import Senai from '../../assets/imgs/logo-senai-principal.png';
import Logo from '../../assets/imgs/logo-dark.png';
import Button from '../../components/button';
import CandidatoApi from '../../api/candidatos';
import NotificacaoApi from '../../api/notificacoes';
import { Link, useHistory, useLocation } from 'react-router-dom';
import { Candidato } from '../../models/candidato';
import { useAlert } from 'react-alert';


function CadastroDadosCandidato(): any {

    const alert = useAlert();

    const [candidato, setCandidato] = useState<Candidato>(new Candidato());

    const location = useLocation<any>();
    let history = useHistory();

    useEffect(() => {
        setCandidato({ ...candidato, idUsuarioNavigation: { email: location.state.email, senha: location.state.senha } })
    }, []);

    function salvar() {
        if (candidato != undefined) {
            CandidatoApi.salvar(candidato, 0).then(data => {
                if (data != null || data != undefined) {
                    history.push("/login")
                    NotificacaoApi.addNotificacao(`Candidato ${candidato.nome} se cadastrou.`)
                }
            });
        } else {
            alert.error("Campos não preenchidos.")
        }
    }

    return (
        // Lado esquerdo
        <div className="w-full flex">
            {/* Lado esquerdo */}
            <div className="flex fundo flex-col justify-between items-center sm:flex hidden">
                <img src={Senai} alt="" className="w-14 h-12 mt-4" />
                <div className="">
                    <p className="escrito tracking-wider font-bold"><i> Sua conexão</i></p>
                    <p className="escrito tracking-wider font-bold"><i> com empresas</i></p>
                    <p className="escrito tracking-wider font-bold"><i> começa agora.</i></p>
                </div>
                <img src={Logo} alt="" className="w-2/5 " />
            </div>
            {/* Lado direito */}
            <div className="login flex w-full bg-white">
                <div className="login flex flex-col m-16 ml-48">
                    <h1 className="font-bold text-4xl">Crie sua conta</h1>
                    <form onSubmit={event => {
                        event.preventDefault()
                        salvar()
                    }}>

                        <div className="flex flex-col justify-between mt-8">
                            <Input mask="" type="name" name="Nome" label="Nome completo:" placeholder="Pedro Augusto da Silva" className="input " required
                                onChange={e => setCandidato({ ...candidato, nome: e.target.value })}
                                value={candidato?.nome}></Input>

                            <Input mask="99/99/9999" type="" name="" label="Data de nascimento:" placeholder="11/11/2011" className="input mt-2" required
                                onChange={e => setCandidato({ ...candidato, dataNascimento: e.target.value })}
                                value={candidato?.dataNascimento}></Input>

                            <div className="flex justify-between mt-2">
                                <Input mask="999.999.999-99" type="" name="cpf" label="CPF:" placeholder="123.456.789-12" className="input" required
                                    onChange={e => setCandidato({ ...candidato, cpf: e.target.value })}
                                    value={candidato?.cpf}></Input>

                                <Input mask="99.999.999-9" type="" name="RG" label="RG:" placeholder="39.086.782-2" className="input ml-2" required
                                    onChange={e => setCandidato({ ...candidato, rg: e.target.value })}
                                    value={candidato?.rg}></Input>
                            </div>

                            <div className="flex justify-between mt-2">
                                <Input mask="99999-999" type="" name="cep" label="CEP:" placeholder="00001001" className="input" required
                                    onChange={e => setCandidato({ ...candidato, idEnderecoNavigation: { cep: e.target.value } })}
                                    value={candidato.idEnderecoNavigation?.cep}></Input>
                                <Input mask="99999999" type="" name="matricula" label="Matricula:" placeholder="15121105" className="input ml-2" required
                                    onChange={e => setCandidato({ ...candidato, matricula: e.target.value })}
                                    value={candidato.matricula}></Input>
                            </div>

                            <Input mask="" type="text" name="matricula" label="Curso:" placeholder="Desenvolvimento de Sistemas" className="input" required
                                onChange={e => setCandidato({ ...candidato, curso: e.target.value })}
                                value={candidato.curso}></Input>

                            <div className="flex justify-between mt-2">
                                <Input mask="(99)9999-9999" type="" name="Telefone" label="Telefone:" placeholder="(11) 2222-222" className="input " required
                                    onChange={e => setCandidato({ ...candidato, telefoneCandidato: e.target.value })}
                                    value={candidato?.telefoneCandidato}></Input>

                                <Input mask="(99)9999-9999" type="" name="Celular" label="Celular:" placeholder="(11) 99999-9999" className="input ml-2" required
                                    onChange={e => setCandidato({ ...candidato, celularCandidato: e.target.value })}
                                    value={candidato?.celularCandidato}></Input>
                            </div>

                            <div className="flex justify-between">
                                <Link to="/cadastro"><Button className="mt-6" name="Voltar" ghost={true}>Voltar</Button></Link>
                                <ButtonForm className="mt-6 ml-2" name="Login"></ButtonForm>
                            </div>

                        </div>
                    </form>
                    <div className="flex justify-end mt-10">
                        <img className="sm:hidden block w-32" src={Senai} alt="logo senai" ></img>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default CadastroDadosCandidato