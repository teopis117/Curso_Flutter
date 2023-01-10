import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qreader/provider/ui_provider.dart';
import 'package:qreader/src/pages/home_page.dart';
import 'package:qreader/src/pages/mapa_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => new UiProvider(),
        )
      ],
      child: MaterialApp(
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': (context) => HomePageScreen(),
          'mapa': (context) => MapaPage(),
        },
        theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepPurple)),
      ),
    );
  }
}
