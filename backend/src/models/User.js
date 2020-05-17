//llamaremos Schema y model de mongoose
const { Schema, model } = require('mongoose');

//Definiremos los datos que tendran los Users
const UserSchema = new Schema({
    firstName: String,
    lastName: String,
    //URI de la imagen usada como avatar
    avatar: String
});


//exportaremos el Model para el Crud
module.exports = model('User', UserSchema);
