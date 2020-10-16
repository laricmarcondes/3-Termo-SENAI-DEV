import React from 'react';
import Header from '../../components/header/index';
import Footer from '../../components/footer/index';
import Input from '../../components/input/index';
import Button from '../../components/button/index';

import cinema from '../../assets/images/cinema.png';
import refresh from '../../assets/images/refresh.png';
import trash from '../../assets/images/trash.png';

import '../../assets/styles/global.css';
import '../../pages/filmes/style.css';

function Filmes() {
    return (
        <div>
            <Header description="Cadastre os filmes de sua preferência" />

            <div className="tituloFilme">
                <h1>Filmes</h1>
            </div>

            <div className="imgFilmes">
                <img src={cinema} alt="imagem de símbolodo cinema" width="90px" height="90px" />
            </div>

            <div className="centro">
                <div>
                    <main>
                        <div>
                            <div className="tituloLista">
                                <h2>Lista de Filmes</h2>
                            </div>
                            <table id="Filmes">
                                <thead>
                                    <tr>
                                        <th id="titulo">Título do Filme</th>
                                        <th id="genero">Gênero</th>
                                        <th><img src={refresh} alt="imagem de símbolo de atualização" width="30px" height="30px" /></th>
                                        <th><img src={trash} alt="imagem de símbolo de deletar" width="30px" height="30px" /></th>
                                    </tr>
                                    <tr>
                                    <th id="titulo">Título do Filme</th>
                                        <th id="genero">Gênero</th>
                                        <th><img src={refresh} alt="imagem de símbolo de atualização" width="30px" height="30px" /></th>
                                        <th><img src={trash} alt="imagem de símbolo de deletar" width="30px" height="30px" /></th>
                                    </tr>
                                    <tr>
                                    <th id="titulo">Título do Filme</th>
                                        <th id="genero">Gênero</th>
                                        <th><img src={refresh} alt="imagem de símbolo de atualização" width="30px" height="30px" /></th>
                                        <th><img src={trash} alt="imagem de símbolo de deletar" width="30px" height="30px" /></th>
                                    </tr>
                                </thead>
                                <tbody id="body-table">

                                </tbody>
                            </table>
                        </div>

                        <div className="tituloFinal">
                            <p>Cadastrar Filmes</p>
                        </div>

                        <div className="final">
                            <Input type="text" name="tituloFilme" placeholder="Título do Filme" label=""/>
                            <Input type="password" name="generoFilme" placeholder="Gênero" label=""/>

                            <div className="btnFilmes">
                                <Button value="Cadastrar" />
                            </div>
                        </div>

                    </main>
                </div>
            </div>
            <Footer />
        </div>
    );
}

export default Filmes;