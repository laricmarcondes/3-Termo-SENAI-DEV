/* eslint-disable eqeqeq */
import React, { useEffect, useState } from 'react';
import Card from '../../components/card/index';
import CandidatoApi from '../../api/candidatos'
import ImgCandidatoDefault from '../../assets/imgs/default-candidato.png'
import Sidebar from '../../components/sidebar/Index';
import Loader from '../../components/loader';
import Hamburguer from '../../components/hamburguer';
import Button from '../../components/button';
import Dialog from '../../components/dialog';
import Pagination from '../../components/pagination';
import { Candidato } from '../../models/candidato';
import { Link } from 'react-router-dom';
import { API_URL } from '../../api/apisettings';
import { toDate, toHour } from '../../services/date';
import { useAlert } from 'react-alert';
import { Jwt } from '../../services/auth';
import { StatusUsuario } from '../../utils/enums';
import LoadingPage from '../loading';

function AListaCandidato({ match }: any) {
    const {
        params: { id },
    } = match;
    const [candidatos, setCandidatos] = useState<Candidato[]>([]);
    const [candidato, setCandidato] = useState<Candidato>(new Candidato());
    const [visualizarPerfil, setVisualizarPerfil] = useState(false);
    const [currentPage, setCurrentPage] = useState(1);
    const [candidatosPorPagina] = useState(10);
    const [isLoading, setIsLoading] = useState(true);

    const indexOfLastPost = currentPage * candidatosPorPagina;
    const indexOfFirstPost = indexOfLastPost - candidatosPorPagina;
    const candidatosAtuais = candidatos.slice(indexOfFirstPost, indexOfLastPost);
    
    const alert = useAlert();
    
    const paginate = (pageNumber: any) => setCurrentPage(pageNumber);

    useEffect(() => {
        Promise.all([
            CandidatoApi.listar().then(data => setCandidatos(data)),
            CandidatoApi.buscarPorId(id).then(data => setCandidato(data))
        ])
        .then(() => setIsLoading(false))
    }, []);

    function openPerfil(candidatoP: Candidato) {
        setCandidato(candidatoP);
        setVisualizarPerfil(true);
    }

    function closePerfil() {
        setCandidato({});
        setVisualizarPerfil(false);
    }

    
    function renderCandidatos() {
        
        return candidatosAtuais!.map((item: Candidato) => {
            return (
                
                <Card className="flex flex-col mb-5" key={item.idUsuario}>
                    {/* Conteudo encima */}
                    <div className="flex flex-row pb-2">
                        <div className="pr-2">
                            <img className="w-16 h-16 object-contain"
                                src={`${API_URL}Candidato/Img/${item.idUsuario}`}
                                onError={e => e.currentTarget.src = ImgCandidatoDefault} alt="img candidato"></img>
                        </div>
                        <p className="flex items-center">{item.nome}</p>
                    </div>
                    <hr />
                    {/* Conteudo debaixo */}
                    <div className="flex flex-row p-2 text-sm justify-between items-center">
                        <div className="flex flex-col w-1/2 pr-2">
                            <div>
                                <i className="ri-profile-line text-lg" />
                                <span> Cursando {item.curso}</span>
                            </div>
                            <div>
                                <i className="ri-map-pin-line text-lg"></i>
                                <span> {item.idEnderecoNavigation?.localCompleto}</span>
                            </div>
                            <div>
                                <i className="ri-time-line text-lg"></i>
                                <span> Inscrito em {`${toDate(new Date(item.idUsuarioNavigation?.dataCadastrado!))} ${toHour(new Date(item.idUsuarioNavigation?.dataCadastrado!))}`}</span>
                            </div>
                        </div>

                        <div className="hover-gray-200 p-5" onClick={() => openPerfil(item)}>
                            <span className="ri-file-text-line text-2xl flex justify-center cursor-pointer"></span>
                            <span className="cursor-pointer">Ver Perfil</span>
                        </div>
                    </div>
                </Card>
            )
        })
    }
    
    if (isLoading) {
        return (
            <LoadingPage/>
        )
    }
    
    return (
        <div className="body w-full">
            <Hamburguer className="md:hidden flex fixed" />
            <Sidebar className="md:flex hidden"></Sidebar>
            <main className="w-full m-5 flex flex-col">
                <Dialog isOpen={visualizarPerfil} onAfterClose={closePerfil}
                    title="Detalhes do candidato">
                    <div className="flex justify-center gap-2 mt-6">
                        <div className="flex flex-col m-auto md:w-3/5 w-full">
                            <div className="grid md:grid-cols-2 grid-cols-1">
                                {/* Coluna Esquerda */}
                                <div className="flex flex-col flex pr-10">
                                    <div>
                                        <div className="mb-8">
                                            <p className="font-bold">Email</p>
                                            <p>{candidato?.idUsuarioNavigation?.email}</p>
                                        </div>

                                        <div className="mb-8">
                                            <p className="font-bold">Nome</p>
                                            <p>{candidato?.nome}</p>
                                        </div>

                                        <div className="mb-8">
                                            <p className="font-bold">CPF</p>
                                            <p>{candidato?.cpf}</p>
                                        </div>

                                        <div className="mb-8">
                                            <p className="font-bold">Endereço</p>
                                            <p>{candidato?.idEnderecoNavigation?.localCompleto}</p>
                                        </div>

                                        <div className="mb-8">
                                            <p className="font-bold">Telefone</p>
                                            <p>{candidato?.telefoneCandidato}</p>
                                        </div>

                                        <div className="mb-8">
                                            <p className="font-bold"> Formação acadêmica</p>
                                            <p>{candidato?.curso}</p>
                                        </div>
                                    </div>
                                </div>

                                {/* Coluna Direita */}
                                <div className="flex flex-col">
                                    <div>
                                        <div className="mb-8">
                                            <p className="font-bold">Data de Nascimento</p>
                                            <p>{toDate(new Date(candidato?.dataNascimento!))}</p>
                                        </div>

                                        <div className="mb-8">
                                            <p className="font-bold">RG</p>
                                            <p>{candidato?.rg}</p>
                                        </div>

                                        <div className="mb-8">
                                            <p className="font-bold">Número de matrícula do SENAI</p>
                                            <p>{candidato?.matricula}</p>
                                        </div>

                                        <div className="mb-8">
                                            <p className="font-bold">Celular</p>
                                            <p>{candidato?.celularCandidato}</p>
                                        </div>

                                        <div className="mb-8">
                                            <p className="font-bold">Curso</p>
                                            <p>{candidato?.curso}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="flex flex-col items-center">
                                <div className="pb-5">
                                    {Jwt().Role == 1 && candidato?.idStatusUsuario == StatusUsuario.ATIVO && (
                                        <Button onClick={() => {
                                            CandidatoApi.mudarStatus(candidato.idUsuario!, StatusUsuario.BLOQUEADO)
                                            alert.success("Usuário bloqueado.")

                                        }} name="Bloquear Perfil">Bloquear Perfil</Button>
                                    )}

                                    {Jwt().Role == 1 && candidato?.idStatusUsuario == StatusUsuario.BLOQUEADO && (
                                        <Button onClick={() => {
                                            CandidatoApi.mudarStatus(candidato.idUsuario!, StatusUsuario.ATIVO)
                                            alert.success("Usuário foi desbloqueado.")

                                        }} name="Bloquear Perfil">Desbloquear</Button>
                                    )}

                                    {Jwt().Role == 2 && (
                                        <Link to="/Empresa/perfil"><Button name="editar ">Concluir</Button></Link>
                                    )}
                                </div>
                                <Button onClick={closePerfil} ghost={true}>Fechar</Button>
                            </div>
                        </div>
                    </div>
                </Dialog>
                <h1 className="p-10 md:text-2xl text-xl flex justify-center">Gerenciamento de candidatos</h1>
                <div className="lg:w-2/3 m-auto md:text-base text-sm">
                    {renderCandidatos()}
                </div>
                <Pagination
                    className="mt-auto my-5 flex flex-col items-center"
                    objectsPerPage={candidatosPorPagina}
                    totalObjects={candidatos.length}
                    paginate={paginate}
                />

            </main>
        </div>
    );
}

export default AListaCandidato;