import React from 'react';
import { Link } from 'react-router-dom';
import Logo from '../../assets/imgs/logo-dark.png'
import Imagem from '../../assets/imgs/image-13@1x.jpg'
import './index.css'
import LogoSenai from '../../assets/imgs/logo-senai-principal.png';

function Home() {
    return (
        <div className="home">

            <div className="menu">
            <Link to="/login" className="login-cadastro">Login</Link>
            <Link to="/cadastro" className="login-cadastro">Cadastro</Link>
            </div>

            <div className="ladoEsquerdo">
                <div className="logo">
                    <Link to="/"><img id="img" src={Logo} alt="Logo escrito (conexão Vagas)" /></Link>
                </div>
                <div className="conect">
                    <p>Conectamos as melhores</p>
                    <p>vagas com os melhores</p>
                    <p>candidatos</p>
                </div>
            </div>
            <div className="foto-logo">

                <Link to="/"><img id="img" src={Imagem} alt="Imagem com duas pessoas, uma sentada com um notebook e uma em pé com um livro na mão" className="imagem" /></Link>
                <Link to="/"><img id="img" src={LogoSenai} alt="Logo vermelha do senai" className="logoSenai" /></Link>
            </div>
        </div>

    )
}

export default Home