import 'package:flutter/material.dart';
import 'package:design1/screens/basic_design.dart';
import 'package:design1/screens/home_screen.dart';
import 'package:design1/screens/scroll_design.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'basic_design': (_) => BasicDesignScreen(),
        'scroll_screen': (context) => ScrollScreen(),
        'home': (context) => HomeScreen(),
      },
    );
  }
}
