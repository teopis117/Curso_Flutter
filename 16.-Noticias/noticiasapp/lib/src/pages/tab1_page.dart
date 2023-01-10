import 'package:flutter/material.dart';
import 'package:noticiasapp/src/services/news_service.dart';
import 'package:noticiasapp/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  const Tab1Page({Key? key}) : super(key: key);

  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    final headlines = Provider.of<NewsService>(context).headlines;
    return Scaffold(
        body: (headlines.length == 0)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListaNoticias(noticias: headlines));
  }

  @override
  bool get wantKeepAlive => true;
}
