import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/share_preferences/preferences.dart';
import 'package:preferences_app/widgets/side_menu.dart';
import 'package:provider/provider.dart';
import 'package:preferences_app/widgets/widgets.dart';

import '../providers/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  static String routerName = 'settings';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool isDarkmode = false;
  // int gender = 1;
  // String name = 'Pepe';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
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
                  value: Preferences.isDarkmode,
                  title: Text("Darkmode"),
                  onChanged: (value) {
                    Preferences.isDarkmode = value;
                    final ThemeProvider = Provider.of(context, listen: false);
                    setState(() {});
                  }),
              Divider(),
              RadioListTile<int>(
                value: 1,
                title: Text("Masculino"),
                groupValue: Preferences.gender,
                onChanged: (value) {
                  Preferences.gender = value ?? 1;
                  setState(() {});
                },
              ),
              Divider(),
              RadioListTile<int>(
                value: 2,
                title: Text("Femenino"),
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
                  decoration: InputDecoration(
                      labelText: 'Nombre', helperText: 'Nombre del usuario'),
                  initialValue: Preferences.name,
                  onChanged: (value) {
                    Preferences.name = value;
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
