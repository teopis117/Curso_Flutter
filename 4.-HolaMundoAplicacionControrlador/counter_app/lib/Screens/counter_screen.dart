import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//siempre debemos trabajar en un stateless widgets y cuando ya hayamos hecho todo lo que querramos lo cambiemos hasta un statefu
class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

//createState regresa una nueva instancia de convertir el statelss ->stateful
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 10;

  // crear un metodo
  void increase() {
    counter++;
    setState(() {});
  }

  void decrese() {
    counter--;
    setState(() {});
  }

  //primero creamos la funcion
  void reset() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterScreen'),
        elevation: 10.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Clicks counter : $counter', style: fontSize30),
            Text('$counter', style: fontSize30)
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton:
          //solo nos permite crear una instancia de cualquier widget
          //creamos un Row
          CustomFloatingActions(
        //le mandamos la referencia a la funcion,osea que no la esta ejecutando
        increaseFn: increase,
        decreseefn: decrese,
        reset: reset,
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  //todas las variables de final deben de ser inicializadas
  final Function increaseFn;
  final Function decreseefn;
  final Function reset;

  const CustomFloatingActions({
    //todo al nullsafety y con required le decimos al compilado que  es necesario
    Key? key,
    required this.increaseFn,
    required this.decreseefn,
    required this.reset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      //tanto en row como en column podemos posicionar nuestros elementos con mainaxisalignemnt
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
            child: Icon(Icons.exposure_plus_1),
            // onPressed: () => setState(() => counter++),

            // ahora le pasamos el argumento  y el argumento es un incremento de la funcion

            onPressed: () => increaseFn()),

        // //elemento que separa sizedbox
        // const SizedBox(width: 20),

        //crear un boton que reinicie el contador
        //creamos el boton
        FloatingActionButton(
          // a su primer hijo le definimos un icono
          child: Icon(Icons.restore),
          onPressed: () => reset(),
          // onPressed: () => setState(() => counter = 0),
        ),

        //para poder agregar separacion de elementos entre si ,necesitamos agregar un sizebox y es otro widget que permite separar los elementos

        // const SizedBox(width: 20),

        FloatingActionButton(
          child: Icon(Icons.exposure_minus_1_outlined),
          onPressed: () => decreseefn(),
          // onPressed: () => setState(() => counter--),
        ),
      ],
    );
  }
}
