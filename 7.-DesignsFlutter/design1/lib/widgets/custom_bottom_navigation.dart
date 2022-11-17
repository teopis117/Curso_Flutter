import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    //el bottomnaavigation bar nos sirve para crear la parte inferior de nuestra aplicacion
    return BottomNavigationBar(
        selectedItemColor: Colors.pink,
        backgroundColor: Color.fromRGBO(55, 57, 84, 1),
        unselectedItemColor: Color.fromRGBO(116, 117, 152, 1),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined), label: 'Calendario'),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart), label: 'Grafica'),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle_sharp),
              label: 'Usuarios'),
        ]);
  }
}
