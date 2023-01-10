import 'package:flutter/material.dart';
import 'package:prefere/providers/theme_Provider.dart';
import 'package:prefere/screens/screens.dart';
import 'package:prefere/share_preferences/preferencias.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(isDarkmode: Preferences.isDarkmode),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material app',
      initialRoute: SettingsScreens.routerName,
      routes: {
        HomeScreen.routerName: (context) => HomeScreen(),
        SettingsScreens.routerName: (context) => SettingsScreens(),
      },
      theme: Provider.of<ThemeProvider>(context).temaactual,
    );
  }
}
