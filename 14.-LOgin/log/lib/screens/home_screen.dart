import 'package:flutter/material.dart';
import 'package:log/services/auth_service.dart';
import 'package:provider/provider.dart';

import 'package:log/models/models.dart';
import 'package:log/screens/screens.dart';

import 'package:log/services/services.dart';
import 'package:log/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);

    final authservice = Provider.of<AuthService>(context, listen: false);
    if (productsService.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              authservice.logout();
              Navigator.pushReplacementNamed(context, 'login');
            },
            icon: Icon(Icons.logout_outlined)),
        title: Text('Productos'),
        actions: [],
      ),
      body: ListView.builder(
          itemCount: productsService.products.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  productsService.selectedProduct =
                      productsService.products[index].copy();
                  Navigator.pushNamed(context, 'product');
                },
                child: ProductCard(
                  product: productsService.products[index],
                ),
              )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          productsService.selectedProduct =
              new Product(available: false, name: '', price: 0);
          Navigator.pushNamed(context, 'product');
        },
      ),
    );
  }
}
