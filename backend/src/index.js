//llamamos las variables de entorno
require('dotenv').config();
//guardo en una constante el Server creado en app
const app = require('./app');
//guardo el objeto creado en Database.js
const { connect } = require('./database');

//podemos usar app.listen(4000, callback) para iniciar el Server
//para que no realice un Callback lo iniciamos en una funcion
async function main (){
    //Iniciamos la conexion a la BBDD
    await connect();
    //Server escucha en el PORT de Dotenv pero tardara un tiempo
    await app.listen(process.env.PORT);
    console.log('>>>>Server on port', process.env.PORT, ': Connected');
}
//iniciamos el server
main();