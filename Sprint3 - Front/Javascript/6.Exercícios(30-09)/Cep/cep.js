function buscarCep() {
    let cep = document.getElementById('texto').value;
    let info = document.getElementById('info');

    const url = 'https://viacep.com.br/ws/' + cep.trim() + '/json';

    fetch(url, {
            method: 'get' //método  http para tipo de acesso //delete //post // put
        })
        .then(function(response) {
            response.text()
                .then(function(result) {
                    let arr = ['cep', 'logradouro', 'logradouro', 'bairro',
                        'localidade', 'uf', 'ibge', 'gia', 'ddd', 'ddd'
                    ];
                    var jsonResposta = JSON.parse(result);
                    for (let index = 0; index < 10; index++) {
                        let item = document.createElement('p');
                        item.innerHTML = arr[index] + ": " + jsonResposta[Object.keys(jsonResposta)[index]];
                        info.appendChild(item);
                    }
                })
        })
        .catch(function(err) {
            console.error(err); //retornar um erro 
        });
}