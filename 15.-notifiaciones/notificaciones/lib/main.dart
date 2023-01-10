import 'package:flutter/material.dart';
import 'package:notificaciones/screens/home_screen.dart';
import 'package:notificaciones/screens/message_screen.dart';
import 'package:notificaciones/services/push_notificacions_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await PushNotificacionesService.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerkey =
      new GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//context
    PushNotificacionesService.mensajesStreams.listen(
      (event) {
        navigatorKey.currentState?.pushNamed('message', arguments: event);
        print("main:$event");
        final snakbar = SnackBar(content: Text(event));
        messengerkey.currentState?.showSnackBar(snakbar);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      navigatorKey: navigatorKey, //navegar
      scaffoldMessengerKey: messengerkey, //snaks
      routes: {
        'home': (context) => HomeScreen(),
        'message': (context) => messageScreen(),
      },
    );
  }
}
