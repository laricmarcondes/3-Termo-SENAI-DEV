import React, { useEffect, useState } from 'react';
import Header from '../../components/header/index';
import Footer from '../../components/footer/index';
import Input from '../../components/input/index';
import Button from '../../components/button/index';

import theater from '../../assets/images/theater.png';
import imgRefresh from '../../assets/images/refresh.png';
import imgTrash from '../../assets/images/trash.png';

import '../../assets/styles/global.css';
import '../../pages/genero/style.css';

function Genero() {

  const [genero, setGenero] = useState('');
  const [idGenero, setIdGenero] = useState(0);
  const [generos, setGeneros] = useState([]);

  useEffect(() => {
    listar();
  }, []);

  const listar = () => {
    fetch('http://localhost:5000/api/generos', {
      method: 'GET',
      headers: {
        authorization: 'Bearer ' + localStorage.getItem('token-filmes')
      }
    })
      .then(response => response.json())
      .then(dados => {
        setGeneros(dados);
      })
      .catch(err => console.error(err));
  }

  const trash = (id: number) => {
    if (window.confirm('Deseja excluir o Genero?')) {
      fetch('http://localhost:5000/api/generos/' + id, {
        method: 'DELETE',
        headers: {
          authorization: 'Bearer ' + localStorage.getItem('token-filmes')
        }
      })
        .then(response => response.json())
        .then(dados => {
          listar();
        })
        .catch(err => console.error(err));
    }
  }

  const refresh = (id: number) => {
    fetch('http://localhost:5000/api/generos/' + id, {
      method: 'GET',
      headers: {
        authorization: 'Bearer ' + localStorage.getItem('token-filmes')
      }
    })
      .then(response => response.json())
      .then(dados => {
        setIdGenero(dados.idGenero);
        setGenero(dados.nome);
      })
      .catch(err => console.error(err));
  }

  const salvar = () => {
    const form = {
      nome: genero
    };

    const method = (idGenero === 0 ? 'POST' : 'PUT');
    const urlRequest = (idGenero === 0 ? 'http://localhost:5000/api/generos' : 'http://localhost:5000/api/generos/' + idGenero);

    fetch(urlRequest, {
      method: method,
      body: JSON.stringify(form),
      headers: {
        'content-type': 'application/json',
        authorization: 'Bearer ' + localStorage.getItem('token-filmes')
      }
    })
      .then(() => {
        alert('Genero cadastrado');
        setIdGenero(0);
        setGenero('');
        listar();
      })
      .catch(err => console.error(err));
  }

  return (
    <div >
      <Header description="Cadastre os gêneros dos filmes" />

      <div className="tituloGenero">
        <h1>Gêneros</h1>
      </div>

      <div className="imgGeneros">
        <img className="iconGeneros" src={theater} alt="imagem de símbolo do teatro" />
      </div>

      <div className="centro">
        <div>
          <main>
            <div>
              <div className="tituloLista">
                <h2>Lista de Gênero</h2>
              </div>
              <table id="Generos">
                <thead>

                  <tr>
                    {/* <th>Id</th> */}
                    {/* <th>Gênero</th> */}
                    {/* <th>Ações</th> */}
                  </tr>

                </thead>

                <tbody>
                  {
                    generos.map((item: any) => {
                      return (
                        <tr key={item.idGenero}>
                          {/* <td>{item.idGenero}</td> */}
                          <td>{item.nome}</td>

                          <td>
                            <img width="25px" className="icon" src={imgRefresh} onClick={() => refresh(item.idGenero)} alt="" />
                            {/* <input type="button" onClick={() => editar(item.idGenero)} /> */}
                          </td>

                          <td>
                            <img width="25px" className="icon" src={imgTrash} onClick={() => trash(item.idGenero)} alt="" />
                            {/* <input type="button" onClick={() => remover(item.idGenero)} /> */}
                          </td>

                        </tr>
                      )
                    })
                  }
                </tbody>
              </table>
            </div>

            {/*
            <div className="final">
              <Input type="password" name="generoFilme" placeholder="Gênero" label="" />

              <div className="btnGeneros">
                <Button value="Cadastrar" />
              </div>
            </div> */}

            <form onSubmit={event => {
              event.preventDefault();
              salvar();
            }}>
              <div className="final">

                <Input name="genero" label="Cadastrar Gênero" placeholder="Ex: Ação..." value={genero} onChange={e => setGenero(e.target.value)} />
                
                <div className="btnGeneros">
                  <Button value="Salvar" />
                </div>
                
              </div>
            </form>

          </main>
        </div>
      </div>
      <Footer />
    </div>
  );
}

export default Genero;