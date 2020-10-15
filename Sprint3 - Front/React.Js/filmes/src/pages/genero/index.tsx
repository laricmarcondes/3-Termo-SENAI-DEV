import React from 'react';
import Header from '../../components/header/index';
import Footer from '../../components/footer/index';
import '../../assets/styles/global.css';
import theater from '../../assets/images/theater.png';
import '../../pages/genero/style.css';

function Genero() {
    return (
        <div >
                <Header description="Cadastre os gêneros dos filmes"/>
                <h1>Gêneros</h1>
                <img src={theater} alt="imagem de símbolodo teatro" width="100px" height="100px" />

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

export default Genero;