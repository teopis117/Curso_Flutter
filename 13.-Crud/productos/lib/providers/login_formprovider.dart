import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();

  String email = '';
  String Password = '';

  bool _isloading = false;
  bool get isloading {
    return _isloading;
  }

  set isloading(bool valor) {
    _isloading = valor;
    notifyListeners();
  }

  bool isValidForm() {
    print(formkey.currentState?.validate());
    print("$email-$Password");

    return formkey.currentState?.validate() ?? false;
  }
}
