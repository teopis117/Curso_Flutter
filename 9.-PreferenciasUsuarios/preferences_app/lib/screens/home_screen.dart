import 'package:flutter/material.dart';
import 'package:preferences_app/widgets/side_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:preferences_app/share_preferences/preferences.dart';

class HomeScreen extends StatelessWidget {
  static String routerName = 'home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      //el drawer es un widget que nos sirve para poder colocar un menu lateral
      drawer: SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Darkmode:${Preferences.isDarkmode}"),
          Divider(),
          Text("Genero:${Preferences.gender}"),
          Divider(),
          Text("Nombre de usuario:${Preferences.name}"),
          Divider(),
        ],
      ),
    );
  }
}
