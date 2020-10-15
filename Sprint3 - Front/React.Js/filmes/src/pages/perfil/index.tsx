import React from 'react';
import Header from '../../components/header/index';
import Footer from '../../components/footer/index';
import '../../assets/styles/global.css';
import '../../pages/cadastro/style.css';
import Input from '../../components/input/index';
import Button from '../../components/button/index';

function Perfil() {
    return (
        <div>
                <Header description="Edite seu perfil, caso nescessário"/>
            <h1>Perfil</h1>
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
                        <Button value="Editar" />
                        <Button value="Salvar" />
                    </div>
                </main>
            </div>
            <Footer />
        </div>
    );
}

export default Perfil;