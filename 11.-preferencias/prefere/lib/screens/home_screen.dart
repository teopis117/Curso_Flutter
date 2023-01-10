import 'package:flutter/material.dart';
import 'package:prefere/widgets/side_menu.dart';
import 'package:prefere/share_preferences/preferencias.dart';

class HomeScreen extends StatelessWidget {
  static String routerName = 'Home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
        ),
        drawer: SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("isDarkmode:${Preferences.isDarkmode}"),
            Divider(),
            Text("Genero:${Preferences.gender}"),
            Divider(),
            Text("Nombre de usuario:${Preferences.name}"),
            Divider(),
          ],
        ));
  }
}
