import React from 'react';
import {BrowserRouter, Route} from 'react-router-dom';
import Home from './pages/home/index';
import Login from './pages/login/index';
import Cadastro from './pages/cadastro/index';
import Perfil from './pages/perfil/index';
import Filmes from './pages/filmes/index';
import Genero from './pages/genero/index';
import ListaFilmes from './pages/listaFilmes/index';

function Routers(){
    return(
        <BrowserRouter>
            <Route path="/" exact component={Home}/>
            <Route path="/login" component={Login}/>
            <Route path="/cadastro" component={Cadastro}/>
            <Route path="/perfil" component={Perfil}/>
            <Route path="/filmes" component={Filmes}/>
            <Route path="/genero" component={Genero}/>
            <Route path="/listaFilmes" component={ListaFilmes}/>
        </BrowserRouter>
    )
}

export default Routers;