import 'package:flutter/material.dart';
import 'package:productos/screens/loading_screen.dart';
import 'package:productos/services/products_services.dart';
import 'package:productos/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final producsService = Provider.of<ProductsService>(context);
    //si nuestros productos estan cargando colocamos la animacion
    if (producsService.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: ListView.builder(
        //segun la lista de productos podemos determinar el tamaño
        itemCount: producsService.products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: ProductCard(
              //le pasamos de nuestros productos el producto
              product: producsService.products[index],
            ),
            onTap: () {
              producsService.selectProduct =
                  producsService.products[index].copy();

              Navigator.pushNamed(context, 'product');
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
