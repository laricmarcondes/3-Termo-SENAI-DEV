import React, { useState } from 'react';
import Header from '../../components/header/index';
import Footer from '../../components/footer/index';
import '../../assets/styles/global.css';
import '../../pages/cadastro/style.css';
import Input from '../../components/input/index';
import Button from '../../components/button/index';

function Cadastro() {

    const [cont, setCont] = useState(0);

    return (
        <div>
            <div className="cadastrar">
                <Header description="Faça o cadastro para o acesso" text="Pronto para cadastrar?" />
            </div>
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
                        <Button onClick={() => setCont(cont + 1)} value="Cadastrar" />
                        <p>Você clicou {cont}</p>
                    </div>
                </main>
            </div>
            <Footer />
        </div>
    );
}

export default Cadastro;