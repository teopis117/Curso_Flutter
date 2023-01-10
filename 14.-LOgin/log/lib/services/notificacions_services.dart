import 'package:flutter/material.dart';

class NotificationService {
  static late GlobalKey<ScaffoldMessengerState> messengerKey =
      new GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String messsage) {
    final snackBar = new SnackBar(
        content: Text(
      messsage,
      style: TextStyle(color: Colors.white, fontSize: 20),
    ));

    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
