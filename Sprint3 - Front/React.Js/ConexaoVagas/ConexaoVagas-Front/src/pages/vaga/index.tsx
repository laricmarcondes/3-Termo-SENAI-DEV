import React, { useEffect, useState } from 'react';
import Button from '../../components/button';
import VagaApi from '../../api/vagas'
import CandidaturaApi from '../../api/candidatura'
import Sidebar from '../../components/sidebar/Index';
import { Vaga } from '../../models/vaga';
import { HabilidadeVaga } from '../../models/habilidadeVaga';
import { BeneficioVaga } from '../../models/beneficioVaga';
import { Link } from 'react-router-dom';
import { Candidatura } from '../../models/candidatura';
import { Jwt } from '../../services/auth';
import Hamburguer from '../../components/hamburguer';
import { TOKEN_KEY } from '../../api/apisettings';
import { TipoUsuario } from '../../utils/enums'

function VerVaga({ match }: any) {

    const {
        params: { id },
    } = match;

    const [vaga, setVaga] = useState<Vaga>(new Vaga());

    useEffect(() => {
        VagaApi.buscarPorId(id).then(data => setVaga(data))
    }, []);

    function renderHabilidades() {
        if (vaga.habilidadeVaga?.length == 0) return (
            <div></div>
        )

        return vaga.habilidadeVaga?.map((item: HabilidadeVaga) => {
            return (
                <a className="bg-gray-400 px-1 rounded-full m-1 h-8 flex items-center cursor-pointer">
                    {item.idHabilidadeNavigation!.nomeHabilidade}</a>
            )
        })
    }

    function renderBeneficios() {
        if (vaga.beneficioVaga?.length == 0) return (
            <div></div>
        )

        return vaga.beneficioVaga?.map((item: BeneficioVaga) => {
            return (
                <a className="bg-gray-400 px-1 rounded-full m-1 h-8 flex items-center cursor-pointer">
                    {item.idBeneficioNavigation!.nomeBeneficio}</a>
            )
        })
    }

    function salvar() {

        var candidaturaManipulavel: Candidatura = {
            idVaga: id,
            idCandidato: Jwt().jti
        }

        if (candidaturaManipulavel != undefined) {
            CandidaturaApi.salvar(candidaturaManipulavel, 0).then(data => {
                if (data != null || data != undefined) {
                    alert("Cadastrado com sucesso.")
                }
            });
        } else {
            alert('Campos não preenchidos.')
        }
    }

    const botao = () => {
        const token = localStorage.getItem(TOKEN_KEY);
        if (token === undefined || token === null) {
            return (
                <div>

                </div>
            )
        } else {
            if (Jwt().Role == TipoUsuario.ADMINISTRADOR) {
                return (
                    <div className="flex justify-center pt-6">
                        <Link to={`/empresa/resumo/${vaga.idEmpresa}`}>
                            <Button name="Voltar">Voltar</Button>
                        </Link>
                    </div>
                )
            } else if (Jwt().Role == TipoUsuario.CANDIDATO) {
                return (
                    <div className="flex flex-col items-center justify-center pt-6">
                        <div className="pb-5">
                            <Button name="Candidatar-se"
                                onClick={() => salvar()}>Candidatar-se</Button>
                        </div>

                        <div>
                            <Link to="/Candidato/vagas">
                                <Button name="Voltar">Voltar</Button>
                            </Link>
                        </div>
                    </div>

                )
            }
        }
    }

    return (
        <div className="body w-full">
            <Hamburguer className="md:hidden flex fixed" />
            <Sidebar className="md:flex hidden" />
            <main className="w-full m-5">
                <h1 className="p-10 md:text-2xl text-xl flex justify-center">Detalhes da vaga</h1>

                <div className="flex flex-col m-auto md:w-3/5 w-full">

                    <div className="flex justify-center">
                        <p className="font-bold pt-3 pb-12 text-xl">Empresa: {vaga.idEmpresaNavigation?.razaoSocial}</p>
                    </div>

                    <div className="w-full flex flex-col">
                        <div className="grid md:grid-cols-2 grid-cols-1">

                            {/* Coluna Esquerda */}
                            <div className="flex flex-col">
                                <div>
                                    <div className="mb-8">
                                        <p className="font-bold">Título:</p>
                                        <p>{vaga?.titulo}</p>
                                    </div>

                                    <div className="mb-8">
                                        <p className="font-bold">Local:</p>
                                        <p className="pr-8">{vaga?.idEnderecoNavigation?.localCompleto}</p>
                                    </div>

                                    <div className="mb-8">
                                        <p className="font-bold">Carga horária:</p>
                                        <p>{vaga?.cargaHoraria}</p>
                                    </div>

                                    <div className="mb-8">
                                        <p className="font-bold">Habilidades buscadas:</p>
                                        <div className="flex flex-row flex-wrap md:text-base text-xs m-2">
                                            {renderHabilidades()}
                                        </div>
                                    </div>
                                </div>
                            </div>

                            {/* Coluna Direita */}
                            <div className="flex flex-col">
                                <div>
                                    <div className="mb-8">
                                        <p className="font-bold">Salário:</p>
                                        <p>{vaga?.salario}</p>
                                    </div>

                                    <div className="mb-8">
                                        <p className="font-bold">Qualificação:</p>
                                        <p>{vaga?.qualificacao}</p>
                                    </div>

                                    <div className="mb-8">
                                        <p className="font-bold">Descrição:</p>
                                        <p>{vaga?.descricao}</p>
                                    </div>

                                    <div className="mb-4">
                                        <p className="font-bold">Benefícios:</p>
                                        <div className="flex flex-column flex-wrap md:text-base text-xs m-2">
                                            {renderBeneficios()}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        {botao()}
                    </div>
                </div>
            </main>
        </div>
    )
}

export default VerVaga;