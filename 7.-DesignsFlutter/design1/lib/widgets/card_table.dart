import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        //todos los table row deben tener los mismos numeros de hijos
        // y si queremos que un elemento para rellenar podemos crear un container vacio
        TableRow(
          children: [
            _SingleCard(
                color: Colors.blue, icon: Icons.border_all, texto: "general"),
            _SingleCard(
                color: Colors.pinkAccent,
                icon: Icons.emoji_transportation,
                texto: "Transporte"),
          ],
        ),
        TableRow(children: [
          _SingleCard(color: Colors.purple, icon: Icons.cabin, texto: "casa"),
          _SingleCard(color: Colors.green, icon: Icons.zoom_in, texto: "zoom"),
        ]),
        TableRow(children: [
          _SingleCard(
              color: Colors.yellow, icon: Icons.safety_check, texto: "safety"),
          _SingleCard(
              color: Colors.red, icon: Icons.card_giftcard, texto: "Card"),
        ]),
        TableRow(
          children: [
            _SingleCard(
                color: Colors.blue, icon: Icons.border_all, texto: "general"),
            _SingleCard(
                color: Colors.pinkAccent,
                icon: Icons.emoji_transportation,
                texto: "Transporte"),
          ],
        ),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String texto;
  const _SingleCard(
      {super.key,
      required this.icon,
      required this.color,
      required this.texto});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          margin: EdgeInsets.all(15),
          height: 180,
          decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: color,
                child: Icon(
                  icon,
                  size: 35,
                  color: Colors.white,
                ),
                radius: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                texto,
                style: TextStyle(color: Colors.blue, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
