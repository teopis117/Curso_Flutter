import 'package:flutter/material.dart';
import 'package:fl_components/models/models.dart';
import 'package:fl_components/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'Listview1',
        icon: Icons.list,
        name: 'Listview1',
        screen: const Listview1Screen()),
    MenuOption(
        route: 'Listview2',
        icon: Icons.list_alt,
        name: 'Listview2',
        screen: const Listview2Screen()),
    MenuOption(
        route: 'Alert',
        icon: Icons.warning,
        name: 'Alert',
        screen: const AlertScreen()),
    MenuOption(
        route: 'Card',
        icon: Icons.card_giftcard,
        name: 'Card',
        screen: const CardScreen()),
    MenuOption(
        route: 'avatar',
        icon: Icons.supervised_user_circle_outlined,
        name: 'AvatarScreen',
        screen: const AvatarScreen()),
    MenuOption(
        route: 'animated',
        icon: Icons.play_circle_fill_outlined,
        name: 'Animated Screen',
        screen: const AnimatedScreen()),
    MenuOption(
        route: 'input',
        icon: Icons.input_rounded,
        name: 'Texts Inputs',
        screen: const InputScreen()),
    MenuOption(
        route: 'slider',
        icon: Icons.slow_motion_video_rounded,
        name: 'Slider',
        screen: const SliderScreen()),
    MenuOption(
        route: 'ListviewBuilder',
        icon: Icons.build_circle_outlined,
        name: 'Infinite Scroll',
        screen: const ListVierBuilderScreen()),
  ];

  //vamos a crear metodo que va a regresar un mapa que tenga como llave un string y que apuntara una funcion que regresara un widget
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    // cremoas un mapa
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});
    //esto es un for in
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

//   static Map<String, Widget Function(BuildContext)> routes = {
// //nombrede la ruta
//     'Home': ((context) => const HomeScreen()),
//     'Listview1': ((context) => const Listview1Screen()),
//     'Listview2': ((context) => const Listview1Screen()),
//     'Alert': ((context) => const AlertScreen()),
//     'Card': ((context) => const CardScreen()),
//   };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    (settings) {
      return MaterialPageRoute(builder: (context) => const AlertScreen());
    };
  }
}
