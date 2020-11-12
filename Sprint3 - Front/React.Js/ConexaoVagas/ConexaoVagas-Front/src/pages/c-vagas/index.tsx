import React, { useEffect, useState } from 'react';
import Card from '../../components/card';
import Senai from '../../assets/imgs/logo-senai-principal.png'
import Input from '../../components/input';
import Sidebar from '../../components/sidebar/Index';
import Select from '../../components/select';
import VagaApi from '../../api/vagas';
import HabilidadeApi from '../../api/habilidades';
import CandidatoApi from '../../api/candidatos';
import Loader from '../../components/loader';
import Button from '../../components/button';
import { Vaga } from '../../models/vaga';
import { HabilidadeVaga } from '../../models/habilidadeVaga';
import { Habilidade } from '../../models/habilidade';
import { Matching } from '../../models/matching';
import { Candidato } from '../../models/candidato';
import { Link } from 'react-router-dom';
import Hamburguer from '../../components/hamburguer';
import { Jwt } from '../../services/auth';

function VagasRecomendadas() {

    const [vagas, setVagas] = useState<Vaga[]>([]);
    const [habilidades, setHabilidades] = useState<Habilidade[]>([]);
    const [matches, setMatches] = useState<Matching[]>([])
    const [filtro, setFiltro] = useState(
        {
            titulo: "",
            minSalario: 0,
            idHabilidade: 0
        }
    );

    useEffect(() => {
        VagaApi.listar().then(data => setVagas(data));
        HabilidadeApi.listar().then(data => setHabilidades(data));
        CandidatoApi.buscarPorId(Jwt().jti).then(data => setMatches(data.matching!))
    }, [])

    function filtrarVagas() {
        VagaApi.listarPorFiltro(filtro.titulo, filtro.minSalario, filtro.idHabilidade)
            .then(data => setVagas(data))
    }

    function renderVagas() {
        if (vagas.length == 0) return (
            <Loader className="mx-auto m-5"></Loader>
        )

        return vagas.map((item: Vaga) => {
            return (
                <Link className="cursor-pointer" to={`/vaga/${item.idVaga}`}>
                    <Card className="flex flex-col">
                        {/* Conteudo encima */}
                        <div className="flex flex-row p-2">
                            <div className="pr-2">
                                <img className="w-16 h-16 object-contain" src={Senai}></img>
                            </div>
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
                                    <span> {item.dataExpiracao}</span>
                                </div>
                            </div>
                            <div className="w-1/2 flex flex-row flex-wrap md:text-base text-xs">
                                {item.habilidadeVaga?.map((hv: HabilidadeVaga) => {
                                    return (
                                        <a className="bg-gray-400 p-2 rounded-full m-1 h-8 flex items-center">
                                            {habilidades.find((h: Habilidade) =>
                                            h.idHabilidade == hv.idHabilidade)?.nomeHabilidade}
                                        </a>
                                    )
                                })}
                            </div>
                        </div>
                    </Card>
                </Link>
            )

        })
    }

    function renderRecomendados() {
        if (matches.length == 0) return (
            <Loader className="mx-auto m-5"></Loader>
        )

        return matches.map((item: Matching) => {
            return (
                <Link className="cursor-pointer" to={`/vaga/${item.idVaga}`}>
                    <Card className="col-span-1 flex flex-col w-full">
                        {/* Conteudo encima */}
                        <div className="flex flex-row p-2">
                            <div className="pr-2">
                                <img className="w-16 h-16 object-contain" src={Senai}></img>
                            </div>
                            <div>
                                <p className="flex items-center">{item.porcentagem}% de Match</p>
                                <p className="flex items-center text-sm truncate w-full">{item.idVagaNavigation?.titulo}</p>
                            </div>
                        </div>
                        <hr />
                        {/* Conteudo debaixo */}
                        <div className="flex flex-row p-2 text-sm">
                            <div className="flex flex-col w-full pr-2">
                                <div className="truncate w-full">
                                    <i className="ri-money-dollar-circle-line text-lg" />
                                    <span > R$ {item.idVagaNavigation?.salario}</span>
                                </div>
                                <div className="truncate w-full">
                                    <i className="ri-map-pin-line text-lg"></i>
                                    <span > {item.idVagaNavigation?.idEnderecoNavigation?.localCompleto}</span>
                                </div>
                                <div className="truncate w-full">
                                    <i className="ri-time-line text-lg"></i>
                                    <span > {item.idVagaNavigation?.dataExpiracao}</span>
                                </div>
                            </div>
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
            <main className="w-full m-5">
            <h1 className="text-2xl text-center m-5">Busca por Vagas</h1>
                {/* Searchbar */}
                <div className="flex items-center md:w-1/2 w-4/5 m-auto py-5">
                    <input className="w-full h-10 rounded-md border-1 
                                      shadow shadow-md outline-none p-2"
                        value={filtro.titulo}
                        onChange={e => setFiltro({ ...filtro, titulo: e.target.value })}
                        placeholder="Ex: Desenvolvedor C#..." />
                    <div className="pl-5">
                        <Button className=" ri-search-line text-md" onClick={(e: any) => filtrarVagas()}></Button>
                    </div>
                </div>
                <section className="grid lg:grid-cols-4 grid-cols-1 gap-5">
                    {/* Não manipule as margens por aqui, a responsividade fica ruim. */}
                    <div className="col-span-1 xl:w-64 w-full ml-auto">
                        <Card className="flex flex-col">
                            <div>
                                <p className="text-center font-bold pb-2">Filtros</p>
                                <hr />
                            </div>
                            <div className="my-2">
                                <Select label="Salário" name="salario"
                                    onChange={e => setFiltro({ ...filtro, minSalario: parseInt(e.target.value) })}
                                    value={filtro.minSalario}>
                                    <option value="0" selected>Selecione um mínimo</option>
                                    <option value="1000">R$1.000</option>
                                    <option value="1500">R$1.500</option>
                                    <option value="2000">R$2.000</option>
                                    <option value="4000">R$4.000</option>
                                    <option value="8000">R$8.000</option>
                                </Select>
                                <br />
                                <Select label="Habilidade" name="habilidade"
                                    onChange={e => setFiltro({ ...filtro, idHabilidade: parseInt(e.target.value) })}
                                    value={filtro.idHabilidade}>
                                    <option value="0" selected>Selecione uma opção</option>
                                    {habilidades.map((h: Habilidade) => {
                                        return (
                                            <option value={h.idHabilidade}>{h.nomeHabilidade}</option>
                                        )
                                    })}
                                </Select>
                            </div>
                        </Card>
                    </div>
                    <div className="col-span-2">
                        {/* Lista de Vagas */}
                        <div className="flex flex-col gap-5">
                            {renderVagas()}
                        </div>
                    </div>
                    {/* Espaço vazio */}
                    <div className="col-span-1"></div>
                </section>
                {matches.length > 0 &&
                <section className="lg:w-2/3 w-full m-auto">
                    <h2 className="p-10 md:text-2xl text-xl flex justify-center">Vagas Recomendadas</h2>
                    <div className="grid md:grid-cols-2 grid-cols-1 gap-5">
                        {renderRecomendados()}
                    </div>
                </section>
                }
            </main>
        </div>
    )
}

export default VagasRecomendadas