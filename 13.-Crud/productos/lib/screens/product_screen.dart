import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productos/providers/product_form_provider.dart';
import 'package:productos/services/products_services.dart';
import 'package:productos/widgets/product_image.dart';
import 'package:productos/ui/inputs_decorations.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productservice = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
      create: (context) => ProductFormProvider(productservice.selectProduct!),
      child: _ProductScreenBody(productservice: productservice),
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productservice,
  }) : super(key: key);

  final ProductsService productservice;

  @override
  Widget build(BuildContext context) {
    final producform = Provider.of<ProductFormProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save_outlined),
        onPressed: () async {
          //guardar producto
          if (!producform.isValidForm()) return;
          await productservice.updateProduct(producform.product);
        },
      ),
      body: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage(url: productservice.selectProduct!.picture),
                Positioned(
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  top: 60,
                  left: 20,
                ),
                Positioned(
                  child: IconButton(
                    onPressed: () => {},
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  top: 60,
                  right: 30,
                )
              ],
            ),
            _productform(),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

class _productform extends StatelessWidget {
  const _productform({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final producform = Provider.of<ProductFormProvider>(context);

    final produc = producform.product;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: producform.formkey,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                initialValue: produc.name,
                onChanged: (value) => produc.name = value,
                validator: (value) {
                  if (value == null || value.length < 1) {
                    return 'el nombre es obligatorio';
                  }
                },
                decoration: InputDecorations.authInputDecoration(
                    hinttext: 'Nombre del producto', labeltext: 'Nombre'),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                initialValue: '${produc.price}',
                onChanged: (value) {
                  if (double.tryParse(value) == null) {
                    produc.price = 0;
                  } else {
                    produc.price = double.parse(value);
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                    hinttext: '\$150', labeltext: 'Precio'),
              ),
              SizedBox(
                height: 30,
              ),
              SwitchListTile.adaptive(
                value: produc.available,
                activeColor: Colors.indigo,
                onChanged: (value) {
                  producform.updateAvailability(value);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
