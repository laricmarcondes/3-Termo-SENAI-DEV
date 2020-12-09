import React from 'react';
import { BrowserRouter, Route } from 'react-router-dom';
import ADashboard from './pages/a-dashboard';
import AEmpresaGeral from './pages/empresa-resumo';
import AListaCandidato from './pages/a-gerenciamento-candidatos';
import VagasRecomendadas from './pages/vagas';
import ECadastrarVagas from './pages/e-cadastrar-vagas';
import ESuasVagas from './pages/e-suas-vagas';
import Home from './pages/home';
import Login from './pages/login';
import CHistoricoCandidaturas from './pages/c-historico-candidaturas';
import AGerenciarEmpresas from './pages/a-gerenciamento-empresas';
import EDashboard from './pages/e-dashboard';
import VerVaga from './pages/vaga';
import CadastroEmpresa from './pages/cadastro-login-empresa';
import CadastroCandidato from './pages/cadastro-login-candidato';
import CadastroDadosEmpresa from './pages/cadastro-dados-empresa';
import CadastroDadosCandidato from './pages/cadastro-dados-candidato';
import Cadastro from './pages/cadastro';
import EVisualizarVaga from './pages/e-vaga-candidaturas';
import EditarPerfilEmpresa from './pages/e-editar-perfil';
import EditarPerfilCandidato from './pages/c-editar-perfil';

function Routers() {
    return (
        <BrowserRouter>
            <Route path="/Administrador/dashboard" exact component={ADashboard} />
            <Route path="/Administrador/gerenciamento-candidatos" exact component={AListaCandidato} />
            <Route path="/Administrador/gerenciamento-empresas" exact component={AGerenciarEmpresas} />
            <Route path="/Empresa/dashboard" exact component={EDashboard} />
            <Route path="/Empresa/suas-vagas" exact component={ESuasVagas} />
            <Route path="/Empresa/cadastrar-vagas" exact component={ECadastrarVagas} />
            <Route path="/Empresa/editar-perfil" exact component={EditarPerfilEmpresa} />
            <Route path="/Candidato/editar-perfil" exact component={EditarPerfilCandidato} />
            <Route path="/Empresa/visualizar-vaga" exact component={EVisualizarVaga} />
            <Route path="/Candidato/historico-candidaturas" exact component={CHistoricoCandidaturas} />

            {/* Páginas dinâmicas, não precisa colocar maiúsculo por não pertencer à um tipo de usuario. */}
            <Route path="/vaga/:id" exact component={VerVaga} />
            <Route path="/empresa/resumo/:id" exact component={AEmpresaGeral} />

            {/* Páginas genéricas */}
            <Route path="/" exact component={Home} />
            <Route path="/login" exact component={Login} />
            <Route path="/cadastro" exact component={Cadastro} />
            <Route path="/cadastro/empresa/passo-1" exact component={CadastroEmpresa} />
            <Route path="/cadastro/candidato/passo-1" exact component={CadastroCandidato} />
            <Route path="/cadastro/empresa/passo-2" exact component={CadastroDadosEmpresa} />
            <Route path="/cadastro/candidato/passo-2" exact component={CadastroDadosCandidato} />
            <Route path="/vagas" exact component={VagasRecomendadas} />
        </BrowserRouter>
    )
}

export default Routers;