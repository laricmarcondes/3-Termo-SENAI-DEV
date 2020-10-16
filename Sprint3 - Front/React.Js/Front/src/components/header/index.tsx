import React from 'react';
import { Link, useHistory } from 'react-router-dom';
import logo from '../../assets/images/logo.png';
import './style.css';
import '../../assets/styles/global.css';

interface HeaderProps {
    description: string;
    text?: string;
}

const Header: React.FC<HeaderProps> = (props) => {

    let history = useHistory();

    const logout = () => {
        localStorage.removeItem('token-filmes');
        history.push('/');
    }

    const menu = () => {
        const token = localStorage.getItem('token-filmes');

        if (token === undefined || token === null) {
            return (
                <ul className="menu">
                    <li><Link className="link" to="/">Home</Link></li>
                    <li><Link className="link" to="/login">Login</Link></li>
                    <li><Link className="link" to="/cadastro">Cadastro</Link></li>
                </ul>
            )
        } else {
            return (
                <ul className="menu1">
                    <li><Link className="link" to="/">Home</Link></li>
                    <li><Link className="link" to="/perfil">Perfil</Link></li>
                    <li><Link className="link" to="/filmes">Filmes</Link></li>
                    <li><Link className="link" to="/genero">Gênero</Link></li>
                    <li><Link to='' onClick={(event) => {
                        event.preventDefault();
                        logout();
                    }}><b>Logout</b></Link></li>
                </ul>
            )
        }
    }

    return (
        <div className="header">
            <div className="align">
                <nav>
                    <Link to="/"><img src={logo} alt="o logo da coletânea" /></Link>
                    {(menu())}
                </nav>
                <h3>{props.description}</h3>
                {props.text && <p>{props.text}</p>}
            </div>
        </div>
    );
}

export default Header;