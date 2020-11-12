import React, { useState } from 'react';
import Logo from '../../assets/imgs/logo-dark.png';
import Input from '../../components/input'
import Senai from '../../assets/imgs/logo-senai-principal.png';
import ButtonForm from '../../components/buttonForm';
import { Link, useHistory } from 'react-router-dom';
import { API_URL } from '../../api/apisettings';



function CadastroEmpresa() {

    var history = useHistory();

    const [email, setEmail] = useState('')
    const [senha, setSenha] = useState('')
    const [senhaConfirmacao, setSenhaConfirmacao] = useState('')

    const cadastro = () => {
        const cadastro = {
            email: email,
            senha: senha
        }

        fetch(API_URL + 'Cadastrar', {
            method: 'PUSH',
            body: JSON.stringify(cadastro),
            headers: {
                'content-type': 'application/json'
            }
        })
            .then(response => response.json())
            .then(dados => {
                if (dados.email == API_URL) {
                    alert("Cadastrado com Sucesso!")
                } else {
                    alert("E-mail existente")
                }
            })
            .catch(error => console.error(error))

    }

    const validarSenha = () => {
        if (senha == senhaConfirmacao && email != '') {
            return (
                history.push({
                    pathname: "/cadastro/empresa/passo-2",
                    state: { email: email, senha: senha }
                })
            )
        } else {
            return (
                alert("Senha ou E-mail inválido, por favor digite novamente!")
            )
        }
    }

    return (
        <div className="fundo w-full flex ">
            <div className="flex flex-col justify-between items-center">
                <img src={Senai} alt="" className="w-14 h-12 mt-4" />
                <div className="">
                    <p className="escrito tracking-wider font-bold"><i> Sua conexão</i></p>
                    <p className="escrito tracking-wider font-bold"><i> com empresas</i></p>
                    <p className="escrito tracking-wider font-bold"><i> começa agora.</i></p>
                </div>
                <img src={Logo} alt="" className="w-2/5 " />
            </div>
            <div className="login flex bg-white w-full h-full">

                <div className="login flex flex-col w-full m-24 mt-20">
                    <h1 className="mt-16 font-bold text-4xl">Crie seu perfil</h1>

                    <form onSubmit={event => {
                        event.preventDefault()
                        cadastro()
                        validarSenha()
                    }}>
                        <Input type="text" name="Email" label="Insira seu email:" placeholder="email@email.com" className="input mt-16"
                            onChange={e => setEmail(e.target.value)} 
                            value={email}/>

                        <div className="flex justify-between">
                            <Input type="password" name="Senha" label="Insira sua senha:" placeholder="*******" className="input flex-1 mr-5 mt-5"
                                onChange={e => setSenha(e.target.value)}
                                value={senha} />
                            <Input type="password" name="Senha" label="Confirme sua senha:" placeholder="*******" className="input flex-1 mt-5"
                                onChange={e => setSenhaConfirmacao(e.target.value)} 
                                value={senhaConfirmacao}/>
                        </div>

                        <div className="flex justify-end">
                            <div className="submit flex items-center">
                                <ButtonForm className="m-0 mt-6" name="cadastro"></ButtonForm>
                                <Link
                                    to={{
                                        pathname: "/cadastro/empresa/passo-2",
                                        state: { email: email, senha: senha } // your data array of objects
                                    }}
                                ></Link>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    );
}

export default CadastroEmpresa