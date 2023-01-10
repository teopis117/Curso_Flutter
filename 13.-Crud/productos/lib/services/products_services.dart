import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:productos/models/products.dart';

class ProductsService extends ChangeNotifier {
  final String _baseUrl = 'flutter-varios-2ad96-default-rtdb.firebaseio.com';
  //lista de productos
  final List<Product> products = [];

  Product? selectProduct;

  bool isLoading = true;
  bool isSaving = false;

  ProductsService() {
    this.loadProducts();
  }

  Future loadProducts() async {
    this.isLoading = true;
    notifyListeners();

    //url base //path
    final url = Uri.https(_baseUrl, 'products.json');

    final resp = await http.get(url);
    //con esta instruccion creamos un mapa donde la respuesta que viene de tipo string la transformamos para que sea un mapa
    final Map<String, dynamic> productMap = json.decode(resp.body);
    //los mapas tienen el foreach que nos ayudan a  trabajar con las llaves y valores de los mapas
    productMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      this.products.add(tempProduct);
    });

    //cuando se haya cargado colocamos el loading en false
    this.isLoading = false;
    notifyListeners();
    return this.products;
  }

  Future saveOcreateProduct(Product productoAguardar) async {
    isSaving = true;
    notifyListeners();

    if (productoAguardar.id == null) {
      //es necesario crear

    } else {
      //actualizar
      await this.updateProduct(productoAguardar);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateProduct(Product producto) async {
    //url base //path
    final url = Uri.https(_baseUrl, 'products/${producto.id}.json');

    final resp = await http.put(url, body: producto.toJson());

    final decodedData = resp.body;
    print(decodedData);

    return producto.id!;
  }
}
