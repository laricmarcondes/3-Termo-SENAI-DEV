import React, { useEffect, useState } from 'react';
import Header from '../../components/header/index';
import Footer from '../../components/footer/index';

import cinema from '../../assets/images/cinema.png';

import '../../assets/styles/global.css';
import '../../pages/listaFilmes/style.css';

function ListaFilmes() {

    const [filmes, setFilmes] = useState([]);

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
                setFilmes(dados);
                setGeneros(dados);
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

    return (
        <div>
            <Header description="Veja os filmes da coleção" />

            <div className="tituloFilme">
                <h1>Filmes</h1>
            </div>

            <div className="imgFilmes">
                <img className="iconFilmes" src={cinema} alt="imagem de símbolodo cinema" />
            </div>

            <div className="centro">
                <div>
                    <main>
                        <div className="lista">
                            <div className="tituloLista">
                                <h2>Lista de Filmes</h2>
                            </div>
                            <table id="listaFilmes">
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
                    </main>
                </div>
            </div>
            <Footer />
        </div>
    );
}

export default ListaFilmes;