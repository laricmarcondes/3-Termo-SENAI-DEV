import React from 'react';
import { BrowserRouter, Route, Redirect, Switch } from 'react-router-dom';
import { parseJwt } from './services/auth'
import Home from './pages/home/index';
import Login from './pages/login/index';
import Cadastro from './pages/cadastro/index';
import Perfil from './pages/perfil/index';
import Filmes from './pages/filmes/index';
import Genero from './pages/genero/index';
import ListaFilmes from './pages/listaFilmes/index';

function Routers() {

    const RotaPrivadaComum = ({ Component, ...rest }: any) => (
        <Route
            {...rest}
            render={props =>
                localStorage.getItem('token-filmes') !== null && parseJwt().Role === 'Comum' ? (
                    <Component {...props} />
                ) : (
                        <Redirect
                            to={{ pathname: "/listaFilmes" }}
                        />
                    )
            }
        />
    );

    const RotaPrivadaAdm = ({ Component, ...rest }: any) => (
        <Route
            {...rest}
            render={props =>
                localStorage.getItem('token-filmes') !== null && parseJwt().Role === 'Administrador' ? (
                    <Component {...props} />
                ) : (
                        <Redirect
                            to={{ pathname: "/filmes" }}
                        />
                    )
            }
        />
    );

    return (
        <BrowserRouter>
            <Switch>
                <Route path="/" exact component={Home} />
                <Route path="/login" component={Login} />
                <Route path="/cadastro" component={Cadastro} />
                <RotaPrivadaAdm path="/perfil" Component={Perfil} />
                <RotaPrivadaAdm path="/filmes" Component={Filmes} />
                <RotaPrivadaAdm path="/genero" Component={Genero} />
                <RotaPrivadaComum path="/listaFilmes" Component={ListaFilmes} />
            </Switch>
        </BrowserRouter>
    )
}

export default Routers;