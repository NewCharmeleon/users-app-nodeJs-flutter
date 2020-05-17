//importamos el paquete Material.dart
//permite utilizar material design en la app movil
import 'package:flutter/material.dart';
//#agregaremos modulo HTTP de Dart en cualquier versión
//en Dependencias del archivo  pubspec.yaml
//http: any
//importaremos el modulo HTTP
import 'package:http/http.dart' as http;
//para poder usar caracteristicas de codigo asincrono como async/await de js
//podemos usar una libreria de dart
import 'dart:async';
//para poder convertir datos a json para mostrarlos en la interfaz
import 'dart:convert';

//llamamos al main principal que siempre se va a ejecutar
void main(){
  //Ejecucion de la App
  runApp(
    //ejecutamos el widget MaterialApp que es la app de flutter
    MaterialApp(
      //Ventana de Inicio, principal, Home
     //dentro especificamos que vamos a pintar
      //usaremos el HomePage
      home: HomePage(),

    ),
  );
}

//Widget el encargado de tener el State de la App
//con esto empezaremos a diseñar nuestra ventana principal
//heredado del Widget StatefulWidget
class HomePage extends StatefulWidget{
  //sobreescribimos  un metodo para crear y definir un State
  @override
  //Definiremos el nuevo State del componente del tipo 
  _HomePageState createState() => _HomePageState();
}
//aca creamos una clase, definimos el State y definir como guardar los datos 
class _HomePageState extends State<HomePage>{
  //definiremos un contenedor Map o una Lista
  Map data;
  //definimos una lista donde guardamos los datos convertidos
  List usersData;
  //Crearemos un metodo para obtener datos mediante peticion HTTP
  //y los asignara al listado de este Widget
  getUsers() async {
    //hara peticion HTTP, traera los datos y los asignaremos
    //al estado de este componente
    //Dart ofrece peticiones HTTP
    //http.Response  response = await http.get('http://localhost:4000/api/users');
    //como el emulador AVD no usa el localhost debemos modificar la URI
    http.Response  response = await http.get('http://10.0.2.2:4000/api/users');
   
    //Imprimiremos los datos por pantalla pero solo el response.body
    //debugPrint(response.body);//lo vemos por consola
    //convertimos los datos a json
    data = json.decode(response.body);
    //definiremos el State del App actualizando los datos del App
    setState(() {
      //elegimos solo los datos del arreglo Users
      usersData = data['users'];
    });
  }
  //para llamar a getUsers() llamaremos al metodo initState
  @override
  void initState(){
    //heredaremos los metodos que ya existen en el Widget anterior
    super.initState();
    //apenas inicia la aplicacion hacemos lo siguiente
    getUsers();

  }
  
  
  //llamaremos al Metodo Build que muestra por pantalla
  //puedo escribir los TypeDefs y su Contexto relacionado con la app en si
  Widget build(BuildContext context){
    //devolveremos un Contenedor para poder dividir el espacion en pantalla
    //y agregamos lo que va a contener la ventana principal
    //la Barra de la App con un Widget
    return Scaffold(
      //Contenido del AppBar
      appBar: AppBar(
        title: Text('User List'),
        //background color
        backgroundColor: Colors.indigo[900],
      ),
      //Contenido del Body
      //usaremos la List que obtuvimos de GetUsers()
      body: ListView.builder(
        //cuantos items vamos a pasar
        //si la Lista es nula pondremos 0 sino el tamaño de la lista
        itemCount: usersData == null ? 0 : usersData.length,
        //que es lo que va a hacer con los datos
        itemBuilder: (BuildContext context, int index){
          //por cada item devolveremos un Card
          return Card(
            //widget hijo
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                //elementos hijo
                children: <Widget>[
                  //que vamos a pintar por pantalla
                 //probamos con el id
                  //Text("${usersData[index]["_id"]}")
                  //agregamos el numero del index y lo estilizaremos con Add padding dentro de otro Widget
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "$index", 
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500
                      ),
                    ),  
                  ),
                  //le decimos que el avatar no esta en la App, es externo
                  CircleAvatar(
                    backgroundImage: NetworkImage(usersData[index]['avatar']),
                  ),
                  //Agregaremos el nombre y el apellido en otro Widget
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "${usersData[index]["firstName"]} ${usersData[index]["lastName"]}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700
                      )
                    ),
                  ),
                ],
              ),
            )
          );
        },
      ), //tomaremos los datos del API
      );
  }
}