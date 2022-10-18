import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//un gestor de estado es algo que gestiona un estado

class HomeScreen extends StatelessWidget {
  //el key nos sirve para identificar un widget en especifico y por lo general dicen que lo conoceran como el contexto
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // crear constantes que nos puedan ayudar para ahorrar codigo o solo cambiando la variable se pueda modificar la aplicacion entera

    const fontSize30 = TextStyle(fontSize: 30);
    int counter = 10;

    // BuildContext es el arbol de widgets y donde veremos toda la informacion que este relacionada a ello y solo mostraremos lo que este adentro del build  context

    //si llega a existir este error significa que debemos de resolverlo en algun momento
    // throw UnimplementedError();

    //casi todo los widgets tienen un child o children
    //el scaffold lo veremos como un lienzo
    return Scaffold(
      // appbar esta esperando un widget que tiene cierto tamaño definido
      appBar: AppBar(
        //con el widget de tittle podemos agregar un titulo pasandole el texto y el titulo de ello
        title: const Text('HomeScreen'),
        //elation nos sirve como para darle el efectode que el elemento padre este levantado
        elevation: 10.0,
      ),

      body: Center(
        child: Column(
          //el alineamiento de los colums en flutter es parecido al de css y html, y los alineamos  con mainaxiWs y crossAxis
          mainAxisAlignment: MainAxisAlignment.center,

          // la mayoria de widgets solo tienen 1 hijo y cuando queramos colocar mas de 1 necesitamos un widget especial
          //nos marcaba un error por en las columnas no podemos hacer uso de las constantes

          //al colocar el <widget> le decimos  que todos los elementos que contendra es de tipo widgets
          children: [
            //para cambiar propiedades de los widgets por lo general dentro de sus parametros podemos encontrar sus demas opciones
            const Text('Clicks counter', style: fontSize30),
            Text('$counter', style: fontSize30)
          ],
        ),
      ),
      //crear un boton flotante:
      //de esta manera podemos cambiar la posicion de nuestro boton
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        //son muchisimo mas las aplicaciones que utilizan solo 1 hijo a que las que utilizan muchos
        child: const Icon(Icons.add),
        onPressed: () {
          counter++;
          print('hola mundo $counter');
        },
        //onpreseed siempre es requerido
      ),
    );
  }
}
