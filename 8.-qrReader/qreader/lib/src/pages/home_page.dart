import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qreader/provider/ui_provider.dart';
import 'package:qreader/src/pages/direcciones_page.dart';
import 'package:qreader/src/pages/mapas_page.dart';
import 'package:qreader/widgets/custom_navigator.dart';
import 'package:qreader/widgets/scan_button.dart';

import '../../provider/ui_provider.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historial"),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete_forever_outlined),
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectMenuopt;
    switch (currentIndex) {
      case 0:
        return MapasPageScreen();
      case 1:
        return DireccionesPage();

      default:
        return MapasPageScreen();
    }
  }
}
