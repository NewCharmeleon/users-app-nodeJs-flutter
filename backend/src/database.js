//llamamos al modulo para la conexion con la BBDD
const mongoose = require('mongoose')

//creamos la constante para guardar el URI
//llamo la variable desde .env
//const MONGODB_URI = process.env.MONGODB_URI;
//separando las cadenas de conexión
//const USERS_APP_NODE_FLUTTER_MONGODB_HOST = process.env.NOTES_APP_CRUD_MONGODB_HOST;
//const USERS_APP_NODE_FLUTTER_MONGODB_DATABASE = process.env.NOTES_APP_CRUD_MONGODB_DATABASE;
//usando ES6
const { USERS_APP_NODE_FLUTTER_MONGODB_HOST, USERS_APP_NODE_FLUTTER_MONGODB_DATABASE } = process.env;
//concatenamos las variables de conexión
//const MONGODB_URI = 'mongodb://${USERS_APP_NODE_FLUTTER_MONGODB_HOST}/${USERS_APP_NODE_FLUTTER_MONGODB_DATABASE}';
const MONGODB_URI = 'mongodb://'+USERS_APP_NODE_FLUTTER_MONGODB_HOST+'/'+USERS_APP_NODE_FLUTTER_MONGODB_DATABASE;

//creamos el metodo de conexion a la BBDD
//si no existe la crea
async function connect(){
    await mongoose.connect(MONGODB_URI, {
    //como el modulo usa MongoCli debemos ver las advertencias
        useUnifiedTopology: true,
        useNewUrlParser: true,
        useCreateIndex:true

    });
    console.log('>>>>Database: Connected')
    
};    
//lo exportamos de esta manera para poder importarlo como objeto nuevamente
module.exports = { connect };
    
