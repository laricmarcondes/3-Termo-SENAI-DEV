import React from 'react';
import Header from '../../components/header/index';
import Footer from '../../components/footer/index';

import cinema from '../../assets/images/cinema.png';
import theater from '../../assets/images/theater.png';

import '../../assets/styles/global.css';
import '../../pages/home/style.css';

function Home() {
    return (
        <div >
            <div className="inicio">
                <Header description="Conheça nossa Coletânea" text="Olá, tudo bem?" />
            </div>

            <div className="titulo">
                <h1>Monte sua coletânea de filmes...</h1>
            </div>

            <div className="centro">
                <div className="main">
                    <main>
                        <div className="texto1">
                            <h2>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor</h2>
                            <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud</p>
                            <p>exercitation ullamco laboris nisi ut eiusmod tempor incididunt ut labore  aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit</p>
                            <p>esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit. </p>
                        </div>

                        <div className="conteudo">
                            <div className="conteudo2">
                                <div className="texto2">

                                    <div>
                                        <img src={cinema} alt="imagem de símbolodo cinema" width="100px" height="100px" />
                                    </div>

                                    <div>
                                        <h2>Filmes</h2>
                                        <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do</p>
                                        <p>eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut </p>
                                        <p>enim ad minim veniam, quis nostrud exercitation ullamco </p>
                                        <p>laboris nisi ut eiusmod tempor incididunt ut labore  aliquip ex ea</p>
                                        <p>commodo consequat. </p>
                                    </div>
                                </div>

                                <div className="texto3">

                                    <div>
                                        <img src={theater} alt="imagem de símbolodo teatro" width="100px" height="100px" />
                                    </div>

                                    <div>
                                        <h2>Categoria</h2>
                                        <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do</p>
                                        <p>eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut </p>
                                        <p>enim ad minim veniam, quis nostrud exercitation ullamco </p>
                                        <p>laboris nisi ut eiusmod tempor incididunt ut labore  aliquip ex ea</p>
                                        <p>commodo consequat. </p>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </main>
                </div>
            </div>
            <Footer />
        </div>
    );
}

export default Home;