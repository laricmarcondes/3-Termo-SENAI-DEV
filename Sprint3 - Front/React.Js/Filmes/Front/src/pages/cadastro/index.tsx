import React, { useEffect, useState } from 'react';
import Header from '../../components/header/index';
import Footer from '../../components/footer/index';
import Input from '../../components/input/index';
import Button from '../../components/button/index';

import '../../assets/styles/global.css';
import '../../pages/cadastro/style.css';

function Cadastro() {

    const [idUsuario, setIdUsuario] = useState(0);
    const [usuarios, setUsuarios] = useState([]);
    const [usuario, setUsuario] = useState('');
    const [email, setEmail] = useState('');
    const [senha, setSenha] = useState('');
    const [permissao, setPermissao] = useState('')

    const salvar = () => {
        const form = {
            nome: usuario,
            email: email,
            senha: senha,
            permissao: permissao
        };

        const method = (idUsuario === 0 ? 'POST' : 'PUT');
        const urlRequest = (idUsuario === 0 ? 'http://localhost:5000/api/usuarios' : 'http://localhost:5000/api/usuarios/' + idUsuario);

        fetch(urlRequest, {
            method: method,
            body: JSON.stringify(form),
            headers: {
                'content-type': 'application/json',
                authorization: 'Bearer ' + localStorage.getItem('token-filmes')
            }
        })

            .then(() => {
                alert('Usuario cadastrado');
                setIdUsuario(0);
                setUsuario('');
                setEmail('');
                setSenha('');
                setPermissao('');

            })
            .catch(err => console.error(err));
    }

    return (
        <div>
            <div className="cadastrar">
                <Header description="Faça o Cadastro para o acesso" text="Pronto para cadastrar?" />
            </div>
            <h1>Cadastro</h1>
            <div className="centro">

                <main>

                    <div className="cadastro">
                        <form onSubmit={event => {
                            event.preventDefault();
                            salvar();
                        }}>
                            <Input type="text" name="nome" label="Nome" value={usuario}
                                onChange={e => setUsuario(e.target.value)} />
                            <br />
                            <Input type="select" name="select" label="Permissão" value={permissao}
                                onChange={e => setPermissao(e.target.value)} />
                            <br />
                            <Input type="email" name="email" label="E-mail" value={email}
                                onChange={e => setEmail(e.target.value)} />
                            <br />

                            <Input type="password" name="senha" label="Senha" value={senha}
                                onChange={e => setSenha(e.target.value)} />

                            <div className="btn">
                                <Button value="Cadastrar" />

                            </div>
                        </form>

                    </div>
                </main>
            </div>
            <Footer />
        </div>
    );
}

export default Cadastro;