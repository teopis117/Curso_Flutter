import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noticiasapp/src/models/categoy_model.dart';
import 'package:noticiasapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = '1c4deb092e644ce1b4f54dd73e76b33d';

class NewsService with ChangeNotifier {
  //en esta propiedad estaran guardados nuestros articulos
  List<Article> headlines = [];

  String _selectedCategory = 'business';

  List<Category> categorias = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    this.getTopHeadlines();
    categorias.forEach((item) {
      this.categoryArticles[item.name] = [];
    });
    this.getArticlesByCategory(this._selectedCategory);
  }

  String get selectedCategory => this._selectedCategory;
  set selectedCategory(String valor) {
    this._selectedCategory = valor;
    this.getArticlesByCategory(valor);

    notifyListeners();
  }

  getTopHeadlines() async {
    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=mx';
    //mandamos la peticion http
    final respuesta = await http.get(Uri.parse(url));
    //obtenemos toda la informacion de la api
    final newResponse = NewResponse.fromJson(respuesta.body);
    //agregamos todos los articulos a nuestra lista de headlines
    this.headlines.addAll(newResponse.articles);

    notifyListeners();
  }

  List<Article> get getArticulosCategoriaSeleccionada =>
      this.categoryArticles[this._selectedCategory]!;

  getArticlesByCategory(String categoria) async {
    if (this.categoryArticles[categoria]!.length > 0) {
      return this.categoryArticles[categoria];
    }

    final url =
        '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=mx&category${categoria}';
    //mandamos la peticion http
    final respuesta = await http.get(Uri.parse(url));
    //obtenemos toda la informacion de la api
    final newResponse = NewResponse.fromJson(respuesta.body);

    this.categoryArticles[categoria]!.addAll(newResponse.articles);
    notifyListeners();
  }
}
