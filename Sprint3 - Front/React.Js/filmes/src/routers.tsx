import React from 'react';
import {BrowserRouter, Route} from 'react-router-dom';
import Home from './pages/home/index';
import Login from './pages/login/index';
import Cadastro from './pages/cadastro/index';

function Routers(){
    return(
        <BrowserRouter>
            <Route path="/" exact component={Home}/>
            <Route path="/login" component={Login}/>
            <Route path="/cadastro" component={Cadastro}/>
        </BrowserRouter>
    )
}

export default Routers;