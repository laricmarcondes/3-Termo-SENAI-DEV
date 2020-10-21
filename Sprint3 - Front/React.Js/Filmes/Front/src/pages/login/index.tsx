import React, { useState } from 'react';
import Header from '../../components/header/index';
import Footer from '../../components/footer/index';
import Input from '../../components/input/index';
import Button from '../../components/button/index';
import { useHistory } from 'react-router-dom';

import '../../assets/styles/global.css';
import '../../pages/login/style.css';


function Login() {

    let history = useHistory();

    // const [cont, setCont] = useState(0);

    const [email, setEmail] = useState('');

    const [senha, setSenha] = useState('');

    const login = () => {
        const login = {
            email: email,
            senha: senha
        }

        fetch('http://localhost:5000/api/conta/login', {
            method: 'POST',
            body: JSON.stringify(login),
            headers: {
                'content-type': 'application/json'
            }
        })
            .then(response => response.json())
            .then(dados => {
                if (dados.token !== undefined || dados.token !== '' || dados.token !== null) {
                    localStorage.setItem('token-filmes', dados.token)
                    history.push('/filmes');
                } else {
                    alert("Senha ou Email incorretos.")
                }
            })
            .catch(error => console.error(error))
    }

    return (
        <div>
            <Header description="Faça o login e acesse a Coletânea" />
            <h1>Login</h1>
            <div className="centro">
                <main>
                    <div className="login">
                        <form onSubmit={event => {
                            event.preventDefault()
                            login()
                        }}>
                            <Input type="email" name="email" label="Email" onChange={e => setEmail(e.target.value)} /> <br />
                            <Input type="password" name="senha" label="Senha" onChange={e => setSenha(e.target.value)} />
                            
                            <div className="btn">
                                <Button value="Enviar" />
                            </div>

                            {/* <Button onClick={() => setCont(cont+1)} value="Enviar" /> */}

                        </form>
                        
                        {/* <br />

                        <p>Quantidade de cliques: {cont}</p> */}
                    </div>
                </main>
            </div>
            <Footer />
        </div>
    );
}

export default Login;