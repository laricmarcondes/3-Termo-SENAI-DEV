import React, { useEffect, useState } from 'react';
import Button from '../../components/button/index';
import EmpresaApi from '../../api/empresa'
import { Empresa } from '../../models/empresa';
import Sidebar from '../../components/sidebar/Index';
import { Link } from 'react-router-dom';
import Input from '../../components/input';
import vagas from '../../api/vagas';
import Hamburguer from '../../components/hamburguer';
import { Jwt } from '../../services/auth';
import TextArea from '../../components/textArea';
import ButtonForm from '../../components/buttonForm';

function EeditarPerfilEmpresa() {

    const [empresaForm, setEmpresaForm] = useState<Empresa>(new Empresa());
    const [empresa, setEmpresa] = useState<Empresa>(new Empresa());

    useEffect(() => {
        EmpresaApi.salvar(empresaForm, Jwt().jti).then(data => setEmpresaForm(data))
        EmpresaApi.buscarPorId(Jwt().jti).then(data => setEmpresa(data))
    }, []);

    function salvar() {
        if (empresaForm != undefined) {
            EmpresaApi.salvar(empresaForm, Jwt().jti).then(data => {
                if (data != null || data != undefined) {
                    alert("Atualizado com sucesso.")
                    setEmpresaForm(new Empresa());
                    EmpresaApi.buscarPorId(Jwt().jti).then(e => setEmpresa(e))
                }
            });
        } else {
            alert('Campos não preenchidos.')
        }
    }

    return (
        <div className="body w-full">
            <Hamburguer className="md:hidden flex fixed" />
            <Sidebar className="md:flex hidden" />
            <main className="w-full m-5">
                <h1 className="p-10 md:text-2xl text-xl flex justify-center">Detalhes da empresa</h1>
                <form className="m-auto lg:w-1/2 w-full" 
                      onSubmit={event => {
                        event.preventDefault();
                        salvar();
                        event.currentTarget.reset();
                    }}>

                    <div className="flex mt-2">
                        <Input className="w-1/2" label="E-mail:" name="email"
                            onChange={e => setEmpresaForm({ ...empresaForm, idUsuarioNavigation: {email: e.target.value} })}
                            value={empresaForm?.idUsuarioNavigation?.email} placeholder={empresa.idUsuarioNavigation?.email}>
                        </Input>

                        <Input className="flex-1 ml-2" label="Nome:" name="nome"
                            onChange={e => setEmpresaForm({ ...empresaForm, nomeFantasia: e.target.value })}
                            value={empresaForm?.nomeFantasia!} placeholder={empresa.nomeFantasia!}>
                        </Input>
                    </div>

                    <div className="flex mt-2">
                        <Input className="flex-1" label="Telefone:" name="telefone"
                            onChange={e => setEmpresaForm({ ...empresaForm, telefoneEmpresa: e.target.value })}
                            value={empresaForm?.telefoneEmpresa} placeholder={empresa.telefoneEmpresa}>
                        </Input>
    
                        <Input className="flex-1 ml-2" label="Celular:" name="telefone" 
                            onChange={e => setEmpresaForm({ ...empresaForm, celularEmpresa: e.target.value })}
                            value={empresaForm?.celularEmpresa} placeholder={empresa.celularEmpresa}>
                        </Input>

                        <Input className="w-32 ml-2" label="CEP:" name="endereco"
                            onChange={e => setEmpresaForm({ ...empresaForm, idEnderecoNavigation: { cep: e.target.value } })}
                            value={empresaForm?.idEnderecoNavigation?.cep} placeholder={empresa.idEnderecoNavigation?.cep}>
                        </Input>
                    </div>

                    <Input className="mt-2" label="Razão Social:" name="razao"
                        onChange={e => setEmpresaForm({ ...empresaForm, razaoSocial: e.target.value })}
                        value={empresaForm?.razaoSocial} placeholder={empresa.razaoSocial}>
                    </Input>

                    <div className="flex mt-2">
                        <Input className="w-1/2" label="CNPJ:" name="cnpj" onChange={e => setEmpresaForm({ ...empresaForm, cnpj: e.target.value })}
                            value={empresaForm?.cnpj} placeholder={empresa.cnpj} disabled>
                        </Input>
    
                        <Input className="flex-1 ml-2" label="CNAE:" name="cnae" onChange={e => setEmpresaForm({ ...empresaForm, cnae: e.target.value })}
                            value={empresaForm?.cnae} placeholder={empresa.cnae} disabled>
                        </Input>
                    </div>


                    <TextArea className="mt-2" label="Descrição:" name="descricao"
                              onChange={e => setEmpresaForm({ ...empresaForm, descricao: e.target.value })}
                              value={empresaForm?.descricao} placeholder={empresa.descricao}>
                    </TextArea>

                    <div className="flex justify-center mt-4">
                        <ButtonForm name="Concluir" value="Salvar Alterações"></ButtonForm>
                    </div>
                </form>

            </main>
        </div>
    );

}

export default EeditarPerfilEmpresa;