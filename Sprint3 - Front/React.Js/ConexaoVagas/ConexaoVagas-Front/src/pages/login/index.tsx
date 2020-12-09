/* eslint-disable eqeqeq */
import React, { useState } from 'react';
import { Link, useHistory } from 'react-router-dom';
import Logo from '../../assets/imgs/logo-dark.png';
import Input from '../../components/input'
import Senai from '../../assets/imgs/logo-senai-principal.png';
import { API_URL, TOKEN_KEY } from '../../api/apisettings';
import {parseJwt } from '../../services/auth';
import ButtonForm from '../../components/buttonForm';
import { TipoUsuario } from '../../utils/enums';


function Login() {

    let history = useHistory();

    const [email, setEmail] = useState('');
    const [senha, setSenha] = useState('');

    const login = () => {
        const login = {
            email: email,
            senha: senha
        }

        fetch(API_URL + 'Login', {
            method: 'POST',
            body: JSON.stringify(login),
            headers: {
                'content-type': 'application/json'
            }
        })
            .then(response => {
                if (!response.ok) alert("Senha ou E-mail incorretos")
                else return response.json()
            })
            .then(dados => {
                if (dados.token !== undefined) {
                    localStorage.setItem(TOKEN_KEY, dados.token)
                    let jwt = parseJwt(dados.token)
                    if (jwt.Role == TipoUsuario.ADMINISTRADOR) history.push('/Administrador/dashboard');
                    else if (jwt.Role == TipoUsuario.EMPRESA) history.push('/Empresa/dashboard');
                    else if (jwt.Role == TipoUsuario.CANDIDATO) history.push('/vagas');
                } else {
                    alert("E-mail existente")
                }
            })
            .catch(error => console.error(error))
    }

    return (
        <div className="fundo w-full flex body">
            <div className="flex flex-col justify-between items-center sm:flex hidden">
                <img src={Senai} alt="" className="w-14 h-12 mt-4" />
                <div className="">
                    <p className="escrito tracking-wider font-bold"><i> Sua conexão</i></p>
                    <p className="escrito tracking-wider font-bold"><i> com empresas</i></p>
                    <p className="escrito tracking-wider font-bold"><i> começa agora.</i></p>
                </div>
                <img src={Logo} alt="" className="w-2/5" />
            </div>
            <div className="login flex bg-white w-full h-full body">

                <div className="login flex flex-col w-full m-24 ">
                    <h1 className="lg:mt-16 lg:ml-8 font-bold text-3xl">Entre com sua conta</h1>

                    <form onSubmit={event => {
                        event.preventDefault()
                        login()
                    }}>
                        <div className="lg:pr-10 lg:pl-10">
                            <Input mask="" type="text" name="Email" label="Insira seu email:" placeholder="email@email.com"
                                className="input mt-16"
                                onChange={e => setEmail(e.target.value)} value={email} />

                            <div className="flex justify-between">
                                <Input mask="" type="password" name="Senha" label="Insira sua senha:" placeholder="*******"
                                    className="input flex-1 mt-5"
                                    onChange={e => setSenha(e.target.value)} value={senha} />
                            </div>
                        </div>

                        <div className="flex justify-between items-center md:justify-between items-center">
                            <div className="submit flex items-center lg:ml-10">
                                <ButtonForm className=" mt-6" name="Login"></ButtonForm>
                            </div>

                            <div className="mr-10">
                                <p className="font-bold "> Não possui conta? <Link to="/cadastro" className="underline">Clique aqui</Link></p>
                            </div>
                        </div>
                    </form>
                    <div className="flex justify-end mt-10">
                        <img className="sm:hidden block w-32" src={Senai} alt="logo senai"></img>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default Login