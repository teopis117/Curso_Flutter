import 'package:flutter/material.dart';
import 'package:noticiasapp/src/pages/tabs_page.dart';
import 'package:noticiasapp/src/services/news_service.dart';
import 'package:noticiasapp/src/theme/tema.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewsService(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          home: TabsPage(),
          theme: myTheme),
    );
  }
}
