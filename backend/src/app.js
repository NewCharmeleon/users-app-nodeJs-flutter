//Requerimos el Server
const express = require('express')
//lo guardamos en una Constante para usarla
const app = express();
//llamaremos al modulo Morgan para ver las rutas URI 
//solicitadas en la termina
const morgan = require('morgan');
//llamaremos al modulo Cors para la comunicacion 
//entre Servers
const cors = require('cors');



//configuraremos el modulo morgan en modo Dev, puede ser
//tambien combined, common, short o tiny
//nos muestra en terminal GET / 404 4.712 ms - 139
app.use(morgan('dev'));
//configuraremos el modulo Cors
app.use(cors());

//llamaremos el objeto Router que tendra las URI del Server
app.use(require('./routes/users'));






//lo exportamos como modulo para ser usado en 
//el archivo de configuracion de la app 
module.exports = app;