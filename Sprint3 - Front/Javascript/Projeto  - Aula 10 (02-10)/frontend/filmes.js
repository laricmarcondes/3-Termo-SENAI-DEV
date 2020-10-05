// var url = "http://localhost:5000/api/Filmes"

// var xhttp = new XMLHttpRequest();
// xhttp.open("GET", url, true);

// xhttp.onreadystatechange = function listarFilmes(){//Função a ser chamada quando a requisição retornar do servidor
//     if ( xhttp.readyState == 4 && xhttp.status == 200 ) {//Verifica se o retorno do servidor deu certo
//         console.log(xhttp.responseText);
//     }
// }
// xhttp.send();

function listarFilmes() {
    const table = document.getElementById('Filmes');
    const url = 'http://localhost:5000/api/Filmes';

    fetch(url)
        .then((resp) => resp.json())
        .then(function (data) {
            console.log(data)


            let tab =
                `<tr>
                    <th>Título do Filme</th>
                    <th>Gênero</th>
                </tr>`;

            let table = data;
            for (let r of table) {
                tab +=
                    `<tr>
                    <th><i>${r.titulo}</i></th>
                    <th><i>${r.idGeneroNavigation.nome}</i></th>
                </tr>`;
            }

            document.getElementById('Filmes').innerHTML = tab;

        })
        .catch((error) => {
            console.log('Ocorreu um problema' + error)
        })
}
