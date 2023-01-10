// SHA1--------------BE:6B:91:E4:36:0E:C6:73:A5:A4:E8:74:27:53:9E:E0:7D:E3:E5:0D

import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

class PushNotificacionesService {
  static FirebaseMessaging messging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream =
      new StreamController.broadcast();

  static Stream<String> get mensajesStreams => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage mensaje) async {
    // print('Background handler ${mensaje.messageId}');
    _messageStream.add(mensaje.data['producto'] ?? 'No data');
    print(mensaje.data);
  }

  static Future _onMessageHandler(RemoteMessage mensaje) async {
    // print('_onMessageHandler ${mensaje.messageId}');
    _messageStream.add(mensaje.data['producto'] ?? 'No data');
    print(mensaje.data);
  }

  static Future _onOpenMessageOpenApp(RemoteMessage mensaje) async {
    // print('_onOpenMessageOpenApp: ${mensaje.messageId}
    // ');
    _messageStream.add(mensaje.data['producto'] ?? 'No data');
    print(mensaje.data);
  }

  static Future initializeApp() async {
    //Push notifiaciones
    await Firebase.initializeApp();

    token = await FirebaseMessaging.instance.getToken();
    print("token: $token");

    //handlers

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);

    //cuando la aplicacion esta abierta
    FirebaseMessaging.onMessage.listen(_onMessageHandler);

    FirebaseMessaging.onMessageOpenedApp.listen(_onOpenMessageOpenApp);

    //local notifaciones
  }

  static closeStreams() {
    _messageStream.close();
  }
}
