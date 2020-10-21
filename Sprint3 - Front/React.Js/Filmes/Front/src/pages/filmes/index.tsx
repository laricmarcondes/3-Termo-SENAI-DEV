import React, { useEffect, useState } from 'react';
import Header from '../../components/header/index';
import Footer from '../../components/footer/index';
import Input from '../../components/input/index';
import Button from '../../components/button/index';

import cinema from '../../assets/images/cinema.png';
import imgRefresh from '../../assets/images/refresh.png';
import imgTrash from '../../assets/images/trash.png';

import '../../assets/styles/global.css';
import '../../pages/filmes/style.css';

function Filmes() {

    const [filme, setFilme] = useState('');
    const [idFilme, setIdFilme] = useState(0);
    const [filmes, setFilmes] = useState([]);

    const [genero, setGenero] = useState('');
    const [idGenero, setIdGenero] = useState(0);
    const [generos, setGeneros] = useState([]);

    useEffect(() => {
        listarFilme();
    }, []);

    useEffect(() => {
        listarGenero();
    }, []);

    const listarFilme = () => {
        fetch('http://localhost:5000/api/filmes', {
            method: 'GET',
            headers: {
                authorization: 'Bearer ' + localStorage.getItem('token-filmes')
            }
        })
            .then(response => response.json())
            .then(dados => {
                listarGenero();
                setFilmes(dados);
                setGeneros(dados);
            })
            .catch(err => console.error(err));
    }

    const listarGenero = () => {
        fetch('http://localhost:5000/api/generos', {
            method: 'GET',
            headers: {
                authorization: 'Bearer ' + localStorage.getItem('token-filmes')
            }
        })
            .then(response => response.json())
            .then(dados => {
                setGeneros(dados);
            })
            .catch(err => console.error(err));
    }

    const trash = (id: number) => {
        if (window.confirm('Deseja excluir o filme?')) {
            fetch('http://localhost:5000/api/filmes/' + id, {
                method: 'DELETE',
                headers: {
                    authorization: 'Bearer ' + localStorage.getItem('token-filmes')
                }
            })
                .then(response => response.json())
                .then(dados => {
                    listarFilme();
                })
                .catch(err => console.error(err));
        }
    }

    const refresh = (id: number) => {
        fetch('http://localhost:5000/api/filmes/' + id, {
            method: 'GET',
            headers: {
                authorization: 'Bearer ' + localStorage.getItem('token-filmes')
            }
        })
            .then(response => response.json())
            .then(dados => {
                setIdFilme(dados.idFilme);
                setFilme(dados.titulo);
                setIdGenero(dados.idGenero);
                setGenero(dados.nome);

            })
            .catch(err => console.error(err));
    }

    const salvar = () => {
        const form = {
            titulo: filme,
            idGenero: parseInt(genero)
        };

        const method = (idFilme && idGenero === 0 ? 'POST' : 'PUT');
        const urlRequest = (idFilme === 0 ? 'http://localhost:5000/api/filmes' : 'http://localhost:5000/api/filmes/' + idFilme);

        fetch(urlRequest, {
            method: method,
            body: JSON.stringify(form),
            headers: {
                'content-type': 'application/json',
                authorization: 'Bearer ' + localStorage.getItem('token-filmes')
            }
        })
            .then(() => {
                alert('filme cadastrado');
                setIdFilme(0);
                setFilme('');
                setIdGenero(0);
                setGenero('');
                listarFilme();
            })
            .catch(err => console.error(err));
    }

    return (
        <div>
            <Header description="Cadastre os filmes de sua preferência" />

            <div className="tituloFilme">
                <h1>Filmes</h1>
            </div>

            <div className="imgFilmes">
                <img className="iconFilmes" src={cinema} alt="imagem de símbolodo cinema" />
            </div>

            <div className="centro">
                <div>
                    <main>
                        <div>
                            <div className="tituloLista">
                                <h2>Lista de Filmes</h2>
                            </div>
                            <table id="filmes">
                                <thead>

                                    <tr>
                                        {/* <th>Id</th> */}
                                        {/* <th>Filmes</th> */}
                                        {/* <th>Ações</th> */}
                                    </tr>

                                </thead>

                                <tbody>
                                    {
                                        filmes.map((item: any) => {
                                            return (
                                                <tr key={item.idFilme} >
                                                    {/* <td>{item.idFilme}</td> */}
                                                    <td>{item.titulo}</td>

                                                    <td>{item.genero.nome}</td>

                                                    <td>
                                                        <img className="icon" src={imgRefresh} onClick={() => refresh(item.idFilme)} alt="" />
                                                        {/* <input type="button" onClick={() => editar(item.idFilme)} /> */}
                                                    </td>

                                                    <td>
                                                        <img className="icon" src={imgTrash} onClick={() => trash(item.idFilme)} alt="" />
                                                        {/* <input type="button" onClick={() => remover(item.idFilme)} /> */}
                                                    </td>

                                                </tr>
                                            )
                                        })
                                    }
                                </tbody>
                            </table>
                        </div>

                        {/*
            <div className="final">
                <Input type="password" name="filme" placeholder="Filmes" label="" />

                <div className="btnFilmes">
                <Button value="Cadastrar" />
                </div>
            </div> */}

                        <form onSubmit={event => {
                            event.preventDefault();
                            salvar();
                        }}>
                            <div className="final">

                                <Input name="filme" label="Cadastrar Filme" placeholder="Ex: Batman..." value={filme} onChange={e => setFilme(e.target.value)} />

                                {/* <Input name="genero" label="Gênero" placeholder="Ex: Ação..." value={genero} onChange={e => setGenero(e.target.value)} /> */}

                                <div className="listaGenero">
                                    <select name="genero" onChange={e => setGenero(e.target.value)} value={genero}>
                                        <option value="0">Selecione um Gênero</option>
                                        {
                                            generos.map((item: any) => {
                                                return <option value={item.idGenero}>{item.nome}</option>
                                            })
                                        }
                                    </select>
                                </div>

                                <div className="btnFilmes">
                                    <Button value="Salvar" />
                                </div>

                            </div>
                        </form>
                    </main>
                </div>
            </div>
            <Footer />
        </div>
    );
}

export default Filmes;