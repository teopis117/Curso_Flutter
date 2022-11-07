import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text("Titulo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("este es el contenido de la alerta"),
                SizedBox(
                  height: 10,
                ),
                FlutterLogo(
                  size: 100,
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    return Navigator.pop(context);
                  },
                  child: Text(
                    "salir",
                    style: TextStyle(color: Colors.black),
                  )),
              TextButton(
                  onPressed: () {
                    return Navigator.pop(context);
                  },
                  child: Text("cancelar")),
            ],
          );
        });
  }

  void displayDialogAndroid(BuildContext context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(10)),
            elevation: 5,
            title: Text("Titulo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("este es el contenido de la alerta"),
                SizedBox(
                  height: 10,
                ),
                FlutterLogo(
                  size: 100,
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    return Navigator.pop(context);
                  },
                  child: Text("cancelar"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            //estamos mandando la referencia a la funcion que esto es diferente a que la estuvieramos ejecutando
            // onPressed: () => displayDialogAndroid(context),
            onPressed: () => displayDialogAndroid(context),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Mostrar Alerta',
                style: TextStyle(fontSize: 20),
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
