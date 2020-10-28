import React from 'react';
import './index.css';
import '../../assets/styles/global.css';
import { Link, useHistory } from 'react-router-dom';
import logo from '../../assets/imgs/logo-dark.png';
import Historico from '../../assets/icons/historico.svg';
import Logout from '../../assets/icons/logout.svg';
import Usuario from '../../assets/icons/usuario.svg';
import Vagas from '../../assets/icons/vagas.svg';
import logo_senai from '../../assets/imgs/logo-senai-principal.png';
import { TOKEN_KEY } from '../../api/apisettings';

function Sidebar(props: any) {
    let history = useHistory(); //Usando o método Histoy

    const logout = () => {
        localStorage.removeItem(TOKEN_KEY);
        history.push('/');
    }
    const menu = () => {
        const token = localStorage.getItem('token-filmes');

        if (token === undefined || token === null) {
            return (
                <ul className="menu">
                    <li><Link to="/">Home</Link></li>
                    <li><Link to="/login">Login</Link></li>
                    <li><Link to="/cadastro">Cadastro</Link></li>
                </ul>
            )
        } else {
            return (
                <ul className="menu">
                    <li><Link to="/">Home</Link></li>
                    <li><Link to="/filmes">Filmes</Link></li>
                    <li><Link to="/generos">Gênero</Link></li>

                    <li><Link to="" onClick={event => {
                        event.preventDefault();
                        logout();
                    }}>Logout</Link></li>
                </ul>
            )
        }
    }

    return (
        <div {...props} className={"side-bar " + props.className}>
            <div className="side-container top">
                <Link to="/"><img id="img" src={logo} alt="Logo escrito (conexão Vagas)" /></Link>
            </div>
            <div className="side-container middle">
                <div className="rela-block side-button c-vagas"></div>
                <div className="rela-block side-button c-historico"></div>
                <div className="rela-block side-button c-meu-perfil"></div>
                <div className="rela-block side-button logout"></div>
                
                <div className="logoSenai">
                    <Link to="/"><img id="img" src={logo_senai} alt="Logo vermelha do senai com escrito branco" /></Link>
                </div>
            </div>
        </div>
    );
}
export default Sidebar;
