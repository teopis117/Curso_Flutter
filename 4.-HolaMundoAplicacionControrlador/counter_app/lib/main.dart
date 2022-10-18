//toda aplicacion en flutter necesita un main

import 'package:counter_app/Screens/counter_screen.dart';
import 'package:counter_app/Screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
//ejecutamos nuestro primer widget el cuals era el que correra nuestra app
//a veces no es tan necesario poner el new  en la creacion
  runApp(const MyApp());
}

//todos los widgets son clases
//esto es una clase debemos hacerlo un widget
//stateless no mantienen el estado o los valores de las aplicaciones
class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  const MyApp({Key? key}) : super(key: key);

  //todo statelesswidget tiene un metodo buld que recibe el build context

  @override
  Widget build(BuildContext context) {
    //el metodo build esta esperando que retornemos un widget

    //los warnings nos ayudaran a saber las mejores recomendaciones del equipo de flutter

    //nos recomendian utilizar las constantes cuando sepamos que no vamos a modificar la aplicacion y nos aconseja que que el widget mas alto lo coloquemos como const
    return const MaterialApp(
        debugShowCheckedModeBanner: false,

        //aca empezamos a ver que los widgets van uno dentro de otro y eso es lo y ademas los warnings nos dan consejos de lo que podemos mejorar en nuestras aplicaciones

        //con esto esta buscando el HomeScreen() en algun punto de nuestros archivos y exportara el archivo a menos que sea privado
        home: CounterScreen());
  }
}
