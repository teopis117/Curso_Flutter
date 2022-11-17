import 'dart:math';

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final boxDecoration = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [
          0.2,
          0.8
        ],
        colors: [
          Color(0xff2E305F),
          Color(0xff202333),
        ]),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          //!color morado
          decoration: boxDecoration,
        ),
        //!pink box
        //con el positioned podemos posicionar en donde querramos nuestro elemento del stack
        Positioned(top: -100, left: -30, child: _PinkBox()),
      ],
    );
  }
}

class _PinkBox extends StatelessWidget {
  const _PinkBox({super.key});

  @override
  Widget build(BuildContext context) {
    //con el widget de transform podemos rotar nuestros elementos
    return Transform.rotate(
      angle: -pi / 5,
      child: Container(
        width: 360,
        height: 360,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(236, 98, 188, 1),
              Color.fromRGBO(251, 142, 172, 1),
            ])),
      ),
    );
  }
}
