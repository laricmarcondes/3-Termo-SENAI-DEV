import React, { useEffect, useState } from 'react';
import Button from '../../components/button';
import { Candidato } from '../../models/candidato';
import CandidatoApi from '../../api/candidatos'
import Sidebar from '../../components/sidebar/Index';
import { Link } from 'react-router-dom';
import Hamburguer from '../../components/hamburguer';

function PerfilCandidato({ match }: any) {

    const {
        params: { id },
    } = match;

    const [candidato, setCandidato] = useState<Candidato>(new Candidato());

    useEffect(() => {
        CandidatoApi.buscarPorId(id).then(data => setCandidato(data))
    }, []);

    return (
        <div className="body w-full">
            <Hamburguer className="md:hidden flex fixed"/>
            <Sidebar className="md:flex hidden" />
            <main className="w-full m-5">
                <h1 className="pt-10 md:text-2xl text-xl flex justify-center">Detalhes do candidato</h1>
                <div className="flex flex-col m-auto md:w-3/5 w-full">
                    <i className="ri-user-line text-6xl flex justify-center"></i>
                    <div className="w-full">

                        <div className="w-full flex flex-col">
                            <div className="grid md:grid-cols-2 grid-cols-1">

                                {/* Coluna Esquerda */}
                                <div className="flex flex-col">
                                    <div>
                                        <div className="mb-8">
                                            <p className="font-bold">Email:</p>
                                            <p>{candidato?.idUsuarioNavigation?.email}</p>
                                        </div>

                                        <div className="mb-8">
                                            <p className="font-bold">Nome:</p>
                                            <p>{candidato?.nome}</p>
                                        </div>

                                        <div className="mb-8">
                                            <p className="font-bold">CPF:</p>
                                            <p>{candidato?.cpf}</p>
                                        </div>

                                        <div className="mb-8">
                                            <p className="font-bold">Endereço:</p>
                                            <p>{candidato?.idEnderecoNavigation?.localCompleto}</p>
                                        </div>

                                        <div className="mb-8">
                                            <p className="font-bold">Telefone:</p>
                                            <p>{candidato?.telefoneCandidato}</p>
                                        </div>

                                        <div className="mb-8">
                                            <p className="font-bold"> Formação acadêmica:</p>
                                            <p>{candidato?.curso}</p>
                                        </div>
                                    </div>
                                </div>

                                {/* Coluna Direita */}
                                <div className="flex flex-col">
                                    <div>
                                        <div className="mb-8">
                                            <p className="font-bold">Data de Nascimento:</p>
                                            <p>{candidato?.dataNascimento}</p>
                                        </div>

                                        <div className="mb-8">
                                            <p className="font-bold">RG:</p>
                                            <p>{candidato?.rg}</p>
                                        </div>

                                        <div className="mb-8">
                                            <p className="font-bold">Número de matrícula do SENAI:</p>
                                            <p>{candidato?.matricula}</p>
                                        </div>

                                        <div className="mb-8">
                                            <p className="font-bold">Celular:</p>
                                            <p>{candidato?.celularCandidato}</p>
                                        </div>

                                        <div className="mb-8">
                                            <p className="font-bold">Curso:</p>
                                            <p>{candidato?.curso}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div className="flex flex-col items-center">
                        <div className="pb-5">
                            <Button name="Bloquear Perfil">Bloquear Perfil</Button>
                        </div>

                        <div className="pb-5">
                            <Link to="/Administrador/gerenciamento-candidatos">
                                <Button name="Voltar">Voltar</Button>
                            </Link>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    )
}

export default PerfilCandidato;