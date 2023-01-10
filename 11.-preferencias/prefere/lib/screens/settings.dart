import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:prefere/providers/theme_Provider.dart';
import 'package:prefere/share_preferences/preferencias.dart';
import 'package:prefere/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class SettingsScreens extends StatefulWidget {
  static String routerName = 'settings';
  const SettingsScreens({super.key});

  @override
  State<SettingsScreens> createState() => _SettingsScreensState();
}

class _SettingsScreensState extends State<SettingsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings Screen"),
      ),
      drawer: SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ajustes",
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
              ),
              Divider(),
              SwitchListTile.adaptive(
                title: Text("Darkmode"),
                value: Preferences.isDarkmode,
                onChanged: (value) {
                  Preferences.isDarkmode = value;

                  final themeprovider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  value
                      ? themeprovider.setDarkMode
                      : themeprovider.setKightMode;

                  setState(() {});
                },
              ),
              Divider(),
              RadioListTile<int>(
                title: Text("Masculino"),
                //el value es el valor que estara asociado a esa seleccion
                value: 1,
                groupValue: Preferences.gender,
                onChanged: (value) {
                  Preferences.gender = value ?? 1;
                  setState(() {});
                },
              ),
              RadioListTile<int>(
                title: Text("Femenimo"),
                value: 2,
                groupValue: Preferences.gender,
                onChanged: (value) {
                  Preferences.gender = value ?? 2;
                  setState(() {});
                },
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  onChanged: (value) {
                    Preferences.name = value;
                    setState(() {});
                  },
                  initialValue: Preferences.name,
                  decoration: InputDecoration(
                      labelText: 'Nombre', helperText: 'Nombre del usuario'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
