import 'package:flutter/material.dart';
import 'package:prefere/screens/screens.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _DraweHeader(),
          ListTile(
            leading: Icon(Icons.pages_outlined),
            title: Text("Home"),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routerName);
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("'People"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("'Settings"),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, SettingsScreens.routerName);
            },
          ),
        ],
      ),
    );
  }
}

class _DraweHeader extends StatelessWidget {
  const _DraweHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover),
      ),
    );
  }
}
