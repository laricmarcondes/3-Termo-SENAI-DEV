import React from 'react';
import {BrowserRouter, Route} from 'react-router-dom';
import ADashboard from './pages/a-dashboard';
import AEmpresaGeral from './pages/empresa';
import AListaCandidato from './pages/a-gerenciamento-candidatos';
import VagasRecomendadas from './pages/c-vagas';
import ECadastrarVagas from './pages/e-cadastrar-vagas';
import ESuasVagas from './pages/e-suas-vagas';
import Home from './pages/home';
import Login from './pages/login';
import CHistoricoCandidaturas from './pages/c-historico-candidaturas';
import AGerenciarEmpresas from './pages/a-gerenciamento-empresas';
import EDashboard from './pages/e-dashboard';
import EeditarPerfilEmpresa from './pages/e-editar-perfil';
import PerfilCandidato from './pages/perfil-candidato';
import PerfilEmpresa from './pages/perfil-empresa';
import VerVaga from './pages/vaga';
import CadastroEmpresa from './pages/cadastro-login-empresa';
import CadastroCandidato from './pages/cadastro-login-candidato';
import CadastroDadosEmpresa from './pages/cadastro-dados-empresa';
import CadastroDadosCandidato from './pages/cadastro-dados-candidato';
import Cadastro from './pages/cadastro';
import EVisualizarVagas from './pages/e-visualizar-vaga';

function Routers(){
    return(
        <BrowserRouter>
            <Route path="/Administrador/dashboard" exact component={ADashboard} />
            <Route path="/Administrador/gerenciamento-candidatos" exact component={AListaCandidato} />
            <Route path="/Administrador/gerenciamento-empresas" exact component={AGerenciarEmpresas} />
            <Route path="/Empresa/dashboard" exact component={EDashboard} />
            <Route path="/Empresa/suas-vagas" exact component={ESuasVagas} />
            <Route path="/Empresa/cadastrar-vagas" exact component={ECadastrarVagas} />
            <Route path="/Empresa/editar-perfil" exact component={EeditarPerfilEmpresa} />
            <Route path="/Empresa/visualizar-vaga" exact component={EVisualizarVagas} />
            <Route path="/Candidato/vagas" exact component={VagasRecomendadas} />
            <Route path="/Candidato/historico-candidaturas" exact component={CHistoricoCandidaturas} />
            
            {/* Páginas dinâmicas, não precisa colocar maiúsculo por não pertencer à um tipo de usuario. */}
            <Route path="/vaga/:id" exact component={VerVaga} />
            <Route path="/empresa/detalhes/:id" exact component={PerfilEmpresa} />
            <Route path="/candidato/detalhes/:id" exact component={PerfilCandidato} />
            <Route path="/empresa/resumo/:id" exact component={AEmpresaGeral} />

            {/* Páginas genéricas */}
            <Route path="/" exact component={Home} />
            <Route path="/login" exact component={Login} />
            <Route path="/cadastro" exact component={Cadastro} />
            <Route path="/cadastro/empresa/passo-1" exact component={CadastroEmpresa} />
            <Route path="/cadastro/candidato/passo-1" exact component={CadastroCandidato} />
            <Route path="/cadastro/empresa/passo-2" exact component={CadastroDadosEmpresa} />
            <Route path="/cadastro/candidato/passo-2" exact component={CadastroDadosCandidato} />
        </BrowserRouter>
    )  
}

export default Routers;