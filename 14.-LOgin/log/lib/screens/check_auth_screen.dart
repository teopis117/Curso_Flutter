import 'package:flutter/material.dart';
import 'package:log/screens/home_screen.dart';
import 'package:log/screens/login_screen.dart';
import 'package:log/services/auth_service.dart';
import 'package:provider/provider.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //asociamos al provider que estara escuchando el token
    final authservice = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          //colocamos la lectura para que pueda leer el toquen
          future: authservice.readToken(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            //microtask es una instruccion es la instruccion tan pronto el builder termine
            Future.microtask(
              () async {
                //guardamos la respuessta
                final resp = await authservice.readToken();
                //Evaluamos que tengamos informacion
                if (resp != '' && resp != null) {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => HomeScreen(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                  //si no tenemos informacion  mandamos al login
                } else {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => LoginScreen(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                }
              },
            );
            return Container();
          },
          //future que debemos de mandar
        ),
      ),
    );
  }
}


// //si no tiene informacion ,retornamos el espere
//             if (!snapshot.hasData) return Text("ESPERE");

//             //!ejecutamos este codigo si no tenngo la data
//             if (snapshot.data == '') {
//               //microtask es una instruccion es la instruccion tan pronto el builder termine
//               Future.microtask(() {
//                 Navigator.pushReplacement(
//                   context,
//                   PageRouteBuilder(
//                     pageBuilder: (context, animation, secondaryAnimation) {
//                       return LoginScreen();
//                     },
//                     transitionDuration: Duration(seconds: 0),
//                   ),
//                 );
//               });
//             } else {
//               Future.microtask(() {
//                 Navigator.pushReplacement(
//                   context,
//                   PageRouteBuilder(
//                     pageBuilder: (context, animation, secondaryAnimation) {
//                       return HomeScreen();
//                     },
//                     transitionDuration: Duration(seconds: 0),
//                   ),
//                 );
//               });
//             }