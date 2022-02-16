import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:happy_dogs_v2/models/users/user_login_response.dart';
import 'package:happy_dogs_v2/models/users/user_register_response.dart';
import 'package:happy_dogs_v2/models/users/user.dart';
import 'package:happy_dogs_v2/global/environment.dart';

class AuthService with ChangeNotifier {
  final _storage = new FlutterSecureStorage();
  User? usuario;
  bool _autenticando = false;
  bool get autenticando => _autenticando;

  // Metodo set
  set autenticando(bool valor) {
    _autenticando = valor;
    notifyListeners(); //actualizamos a todos los widgets que escuchan
  }

  static Future<String?> getToken() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async {
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  //  Loggeo del Usuario
  Future<bool> login(String email, String password) async {
    autenticando = true; //provider
    final data = {'email': email, 'password': password};
    final uri = Uri.parse('${Environment.apiUrl}/login/signin');
    final resp = await http.post(uri,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    autenticando = false;
    if (resp.statusCode == 200) {
      final loginResponse = userLoginResponseFromJson(resp.body);
      print("EXISTE EN LOGIN");
      await _guardarToken(loginResponse.token);
      return true;
    } else {
      print(resp.statusCode);
      return false;
    }
  }

  //  Registro de Usuario
  Future register(String name, String email, String password, String dateBirth, String phoneNumber) async {
    //un future es como una promesa/callback recibe parametros de una page
    autenticando = true;

    final data = {
      'name': name,
      'email': email,
      'password': password,
      'picture_path':'/newuser.jpg',
      'date_of_birth':dateBirth,
      "phone": phoneNumber,
    };

    final uri = Uri.parse('${Environment.apiUrl}/login/signup');
    final resp = await http.post(uri,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});

    autenticando = false;

    if (resp.statusCode == 200) {
      final loginResponse = userRegisterResponseFromJson(resp.body);
      usuario = loginResponse.user;
      await _guardarToken(loginResponse.token);
      // el future puede regresar un booleano o un string
      return true;
    } else {
      //en caso de que el email ya exista
      final respBody = jsonDecode(resp.body);
      return respBody['msg'];
    }
  }

  // Renovamos el token
  Future<bool> isLoggedIn() async {
    // Leemos el token
    final token = await _storage.read(key: 'token') ?? 'no existe';

    final uri = Uri.parse('${Environment.apiUrl}/login/renew');

    final resp = await http.get(uri, headers: {'Content-Type': 'application/json', 'x-token': token});

    // BUG: Entra a la condicion si es 200 aunque el token sea incorrecto pero crashea cuando devuelve la respuesta
    if (resp.statusCode == 200) {
      print(resp.body);
      final inLogginResponse = userLoginResponseFromJson(resp.body);
      print("El token es: ${inLogginResponse.token}");
      await _guardarToken(inLogginResponse.token);

      return true;
    }
    else {
      logout();
      return false;
    }
  }

  // Guardar token
  Future _guardarToken(String token) async {
      return await _storage.write(key: 'token', value: token);
    }

  // Eliminar token
  Future logout() async {
    print("ELIMINANDO");
    await _storage.delete(key: 'token');
  }
}
