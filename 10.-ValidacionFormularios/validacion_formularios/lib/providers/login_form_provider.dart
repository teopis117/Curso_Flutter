import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  //el global key es para hacer referencia a otro widget

  GlobalKey<FormState> formey = new GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    this._isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formey.currentState?.validate());
    print(email);
    print(password);

    return formey.currentState?.validate() ?? false;
  }
}
