import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("avatars"),
        //en el appbar tambien existen los actions

        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: const CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.amber,
            ),
          )
        ],
      ),
      body: Center(
        child: CircleAvatar(
          maxRadius: 100,
          backgroundImage: NetworkImage(
              "https://sm.ign.com/ign_es/screenshot/default/analisis-halo-infinite_cjdd.jpg"),
        ),
      ),
    );
  }
}
