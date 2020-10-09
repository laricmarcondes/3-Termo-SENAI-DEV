import React from 'react';
import Header from '../../components/header/index';
import Footer from '../../components/footer/index';
import '../../assets/styles/global.css';
import '../../pages/cadastro/style.css';
import Input from '../../components/input/index';

function Cadastro() {
    return (
        <div>
            <Header description="Faça o cadastro para o acesso" />
            <h1>Cadastro</h1>
            <div className="centro">

                <main>
                    <div className="cadastro">
                        <Input type="text" name="nome" label="Nome" />
                        <br />
                        <Input type="email" name="email" label="Email" />
                        <br />
                        <Input type="text" name="permissao" label="Permissão" />
                        <br />
                        <Input type="password" name="senha" label="Senha" />

                        <div className="botao">
                            <button>Enviar</button>
                        </div>
                    </div>
                </main>
            </div>
            <Footer />
        </div>
    );
}

export default Cadastro;