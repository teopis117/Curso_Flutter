import 'package:flutter/material.dart';
import 'package:noticiasapp/src/pages/tab1_page.dart';
import 'package:noticiasapp/src/pages/tab2_page.dart';
import 'package:noticiasapp/src/services/news_service.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    final newsService = Provider.of<NewsService>(context);

    return BottomNavigationBar(
        onTap: (i) => navegacionModel.paginaActual = i,
        currentIndex: navegacionModel.paginaActual,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "Person"),
          BottomNavigationBarItem(
              icon: Icon(Icons.public), label: "Encabezados"),
        ]);
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return PageView(
      controller: navegacionModel._pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Tab1Page(),
        Tab2Page(),
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;

  int get paginaActual => this._paginaActual;
  PageController _pageController = new PageController();

  set paginaActual(int valor) {
    this._paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
