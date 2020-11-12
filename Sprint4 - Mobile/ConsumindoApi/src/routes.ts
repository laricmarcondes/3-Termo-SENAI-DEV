import express from 'express';
import db from './database/connection';

const routes = express.Router();
routes.get('/clientes', async (request, response) => {
    const dataBase = await db;
    dataBase.serialize(() => {
        dataBase.each('SELECT * FROM clientes', function (err: { message: any; }, row: any) {
            if (err) {
                console.error(err.message);
            }
            console.log(row)
        });
        return response.send(200)
    });
});

routes.post('/novocliente', async (request, response) => {
    //uma nova rota
    const dataBase = await db;
    dataBase.run(`INSERT INTO clientes (name, telefone, cep, n_casa) VALUES(?,?,?,?)`, [
        `${request.body.name}`, `${request.body.telefone}`, `${request.body.cep}`, `${request.body.n_casa}`], function (err: { message: any; }, row: any) {
            if (err) {
                console.error(err.message);
            }
            console.log(row);
            return response.send(200)
        });
});

export default routes;