import 'package:design1/screens/scroll_design.dart';
import 'package:design1/widgets/background.dart';
import 'package:design1/widgets/card_table.dart';
import 'package:design1/widgets/custom_bottom_navigation.dart';
import 'package:design1/widgets/page_tittle.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //!Background
          Background(),
          //!body
          _HomeBody(),
        ],
      ),
      //!botomNavigator
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //titulos
          PageTittle(),
          //card table
          CardTable(),
        ],
      ),
    );
  }
}
