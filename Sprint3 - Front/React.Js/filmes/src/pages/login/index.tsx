import React, {useState} from 'react';
import Header from '../../components/header/index';
import Footer from '../../components/footer/index';
import '../../assets/styles/global.css';
import Input from '../../components/input/index';
import Button from '../../components/button/index';
import '../../pages/login/style.css';


function Login() {

    const [cont, setCont] = useState(0);

    return (
        <div>
            <Header description="Faça o login para acessar a coletânea" />
            <h1>Login</h1>
            <div className="centro">
                <main>
                    <div className="login">
                        <Input type="email" name="email" label="Email" />
                        <br />
                        <Input type="password" name="senha" label="Senha" />
                        <Button onClick={() => setCont(cont+1)} value="Enviar"/>
                        <p>Você clicou {cont}</p>
                    </div>
                </main>
            </div>
            <Footer />
        </div>
    );
}

export default Login;