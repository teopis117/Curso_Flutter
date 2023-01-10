import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  //base del url y el token de mi proyecto
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyBzZmbNYqY-MtsplKy7lVzzDLbs9q-jYLA';

  final storage = new FlutterSecureStorage();

//creamos el usuario
  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    //la peticion para crear nuestro usuario
    final url =
        //!importante usar https en vez de http
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});
    //mandamos la informacion
    final respuesta = await http.post(url, body: json.encode(authData));

    final Map<String, dynamic> respuestaDecodificada =
        json.decode(respuesta.body);
    if (respuestaDecodificada.containsKey('idToken')) {
      //token hay que guardarlo en un lugar seguro
      await storage.write(
          key: 'idToken', value: respuestaDecodificada['idToken']);

      return null;
    } else {
      return respuestaDecodificada['error']['message'];
    }
  }

  Future<String?> LoginUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    //la peticion para crear nuestro usuario
    final url =
        //!importante usar https en vez de http
        Uri.https(_baseUrl, '/v1/accounts:signInWithPassword',
            {'key': _firebaseToken});
    //mandamos la informacion
    final respuesta = await http.post(url, body: json.encode(authData));

    final Map<String, dynamic> respuestaDecodificada =
        json.decode(respuesta.body);

    print(respuestaDecodificada);
    if (respuestaDecodificada.containsKey('idToken')) {
      //token hay que guardarlo en un lugar seguro
      await storage.write(
          key: 'idToken', value: respuestaDecodificada['idToken']);
      return null;
    } else {
      return respuestaDecodificada['error']['message'];
    }
  }

  Future logout() async {
    await storage.delete(key: 'idToken');
    return;
  }

  Future<String> readToken() async {
    //si el token no existe regresar un string vacio
    return await storage.read(key: 'idToken') ?? '';
  }
}
