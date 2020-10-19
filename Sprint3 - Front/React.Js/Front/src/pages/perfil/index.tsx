import React from 'react';
import Header from '../../components/header/index';
import Footer from '../../components/footer/index';
import Input from '../../components/input/index';
import Button from '../../components/button/index';

import '../../assets/styles/global.css';
import '../../pages/perfil/style.css';

function Perfil() {
    return (
        <div>
            <Header description="Edite seu perfil, caso nescessário" />
            <h1>Perfil</h1>
            <div className="centro">
                <main>
                    <div className="perfil">
                        <Input type="text" name="nome" placeholder="Nome" label="" />
                        <br />
                        <Input type="email" name="email" placeholder="Email" label="" />
                        <br />
                        <Input type="text" name="permissao" placeholder="Permissão" label="" />
                        <br />
                        <Input type="password" name="senha" placeholder="Senha" label="" />
                        <div className="btn1">
                            <Button value="Editar" />
                            <Button value="Salvar" />
                        </div>
                    </div>
                </main>
            </div>
            <Footer />
        </div>
    );
}

export default Perfil;