import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _width = 50;
  double _heigth = 50;
  Color _color = Colors.indigo;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(20);

  void changeShape() {
    //en esta linea le damos un valor a random
    //en esta hacemos que lo aproxime al maximo que es 300
    final random = Random();
    _heigth = random.nextInt(300).toDouble() + 70;
    _width = random.nextInt(300).toDouble() + 70;
    _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble() + 10);
    _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255),
        random.nextInt(255), random.nextInt(100).toDouble());
    print(_color);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
        //el animatedcontainer nos sirve para hacer transiciones
        child: AnimatedContainer(
          //la propiedad de duration nos sirve para poder establecer el tiempo de los cambios
          duration: const Duration(milliseconds: 400),
          //con el curve podemos definir como sera la transicion
          curve: Curves.easeInCubic,
          width: _width,
          height: _width,
          decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.play_circle_fill_outlined,
          size: 35,
        ),
        onPressed: () {
          changeShape();
        },
      ),
    );
  }
}
