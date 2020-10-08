import React from 'react';
import Header from '../../components/header/index';
import Footer from '../../components/footer/index';
import '../../assets/styles/global.css';
import Input from '../../components/input/index';
import '../../pages/login/style.css';


function Login() {
    return (
        <div>
            <Header description="Faça o login para acessar a coletânea" />
            <h1>Login</h1>
            <div className="centro">
                <div className="login">
                    <main>
                        <Input type="email" name="email" label="Email" />
                        <br/>
                        <Input type="password" name="senha" label="Senha" />
                        <div className="botao">
                            <button>Enviar</button>
                        </div>
                    </main>
                </div>
            </div>
            <Footer />
        </div>
    );
}

export default Login;