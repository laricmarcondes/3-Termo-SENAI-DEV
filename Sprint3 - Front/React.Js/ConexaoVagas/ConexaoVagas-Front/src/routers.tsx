import React from 'react';
import {BrowserRouter, Route} from 'react-router-dom';
import AListaCandidato from './pages/a-lista-candidato';
import Home from './pages/home';


function Routers(){
    return(
        <BrowserRouter>
            <Route path="/" exact component={Home} />
            <Route path="/Administrador/lista-candidatos" component={AListaCandidato} />
        </BrowserRouter>
    )  
}

export default Routers;