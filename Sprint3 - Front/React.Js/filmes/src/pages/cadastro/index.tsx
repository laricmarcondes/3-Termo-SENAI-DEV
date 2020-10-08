import React from 'react';
import Header from '../../components/header/index';
import Footer from '../../components/footer/index';
import '../../assets/styles/global.css';

function Cadastro(){
    return(
        <div>
            <Header description="Faça o cadastro para o acesso"/>
            <div className="centro">
                <div className="cadastro">
                <h1>Cadastro</h1>
                </div>
            </div>
            <Footer/>
        </div>
    );
}

export default Cadastro;