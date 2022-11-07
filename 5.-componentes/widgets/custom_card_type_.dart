import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            title: Text("soy un titulo"),
            leading: Icon(
              Icons.photo_album,
              color: AppTheme.primary,
            ),
            subtitle: Text(
                'Fugiat sit eu ea irure velit consequat occaecat cupidatat ex eu minim non. Cillum pariatur qui ex ad qui deserunt eu anim voluptate. Qui incididunt excepteur adipisicing ea. Voluptate esse laborum velit est irure adipisicing nisi excepteur.'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text("cancelar"),
                  onPressed: () {},
                ),
                TextButton(child: const Text("OK"), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
