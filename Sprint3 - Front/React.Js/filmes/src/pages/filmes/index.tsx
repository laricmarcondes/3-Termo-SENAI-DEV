import React from 'react';
import Header from '../../components/header/index';
import Footer from '../../components/footer/index';
import '../../assets/styles/global.css';
import cinema from '../../assets/images/cinema.png';
import '../../pages/filmes/style.css';

function Filmes() {
    return (
        <div >
                <Header description="Cadastre os filmes de sua preferência"/>
                <h1>Filmes</h1>
                <img src={cinema} alt="imagem de símbolodo cinema" width="100px" height="100px" />

            <div className="centro">
                <div>
                    <main>

                    </main>
                </div>
            </div>
            <Footer />
        </div>
    );
}

export default Filmes;