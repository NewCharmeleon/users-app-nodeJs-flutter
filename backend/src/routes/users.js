//llamaremos solo el componente Router del modulo Express
const { Router } = require('express');
//guardaremos en una constante el componente o funcion
//objeto donde definiremos las URI
const router = Router();

//Requeriremos el Modelo Users
const User = require('../models/User');
//Crearemos los datos de pruebas con el modulo Faker
const faker = require('faker');

//Crearemos las Rutas
router.get('/api/users', async (req, res) => {
    //a modo de prueba enviaremos un message
   // res.json('User list');
   const users = await User.find();
   //mostraremos el arreglo con todos los Users dentro de Users
   res.json({users});
  });

router.get('/api/users/create', async ( req, res ) => {
   for (let i = 0; i < 5; i++ ){
        await User.create({
            firstName: faker.name.firstName(),
            lastName: faker.name.lastName(),
            avatar: faker.image.avatar()
        })
   }
    res.json({message: '5 users created'});
})

module.exports = router;