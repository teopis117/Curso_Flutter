import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qreader/provider/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiprovider = Provider.of<UiProvider>(context);
    final currentIndex = uiprovider.selectMenuopt;

    return BottomNavigationBar(
      onTap: (int i) => uiprovider.selectedMenu = i,
      backgroundColor: Colors.blue[50],
      elevation: 0,
      currentIndex: currentIndex,
      items: [
        //por lo menos requiere dos iconos
        BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
        BottomNavigationBarItem(
            icon: Icon(Icons.compass_calibration_outlined),
            label: 'Direcciones'),
      ],
    );
  }
}
