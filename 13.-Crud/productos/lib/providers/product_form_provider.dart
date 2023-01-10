import 'package:flutter/material.dart';
import 'package:productos/models/products.dart';

class ProductFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = new GlobalKey();
  Product product;

  ProductFormProvider(this.product);

  updateAvailability(bool value) {
    print(value);
    this.product.available = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(product.name);
    print(product.id);
    print(product.price);
    print(product.available);

    return formkey.currentState?.validate() ?? false;
  }
}
