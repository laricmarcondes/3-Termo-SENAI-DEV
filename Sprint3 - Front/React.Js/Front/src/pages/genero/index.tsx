import React from 'react';
import Header from '../../components/header/index';
import Footer from '../../components/footer/index';
import Input from '../../components/input/index';
import Button from '../../components/button/index';

import theater from '../../assets/images/theater.png';
import refresh from '../../assets/images/refresh.png';
import trash from '../../assets/images/trash.png';

import '../../assets/styles/global.css';
import '../../pages/genero/style.css';

function Genero() {
    return (
        <div >
            <Header description="Cadastre os gêneros dos filmes" />

            <div className="tituloGenero">
                <h1>Gêneros</h1>
            </div>

            <div className="imgGeneros">
                <img src={theater} alt="imagem de símbolo do teatro" width="90px" height="90px" />
            </div>

            <div className="centro">
                <div>
                    <main>
                        <div>
                            <div className="tituloLista">
                                <h2>Lista de Gênero</h2>
                            </div>
                            <table id="Generos">
                                <thead>
                                    <tr>
                                        <th id="genero">Gênero</th>
                                        <th><img src={refresh} alt="imagem de símbolo de atualização" width="30px" height="30px" /></th>
                                        <th><img src={trash} alt="imagem de símbolo de deletar" width="30px" height="30px" /></th>
                                    </tr>
                                    <tr>
                                        <th id="genero">Gênero</th>
                                        <th><img src={refresh} alt="imagem de símbolo de atualização" width="30px" height="30px" /></th>
                                        <th><img src={trash} alt="imagem de símbolo de deletar" width="30px" height="30px" /></th>
                                    </tr>
                                    <tr>
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
                            <p>Cadastrar Gênero</p>
                        </div>

                        <div className="final">
                            <Input type="password" name="generoFilme" placeholder="Gênero" label="" />

                            <div className="btnGeneros">
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

export default Genero;