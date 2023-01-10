import 'package:flutter/material.dart';
import 'package:noticiasapp/src/models/categoy_model.dart';
import 'package:noticiasapp/src/services/news_service.dart';
import 'package:noticiasapp/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _ListaCategorias(),
            Expanded(
                child: ListaNoticias(
                    noticias: newsService.getArticulosCategoriaSeleccionada))
          ],
        ),
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  const _ListaCategorias({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<NewsService>(context).categorias;
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: categorias.length,
        itemBuilder: (BuildContext context, int index) {
          final cName = categorias[index].name;
          return Padding(
            padding: EdgeInsetsDirectional.all(8),
            child: Column(
              children: [
                _CategoryButton(categoria: categorias[index]),
                SizedBox(
                  height: 5,
                ),
                Text('${cName[0].toUpperCase()}${cName.substring(1)}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category categoria;

  const _CategoryButton({
    Key? key,
    required this.categoria,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = categoria.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          categoria.icon,
          color: (newsService.selectedCategory == this.categoria.name)
              ? Colors.redAccent
              : Colors.black54,
        ),
      ),
    );
  }
}
