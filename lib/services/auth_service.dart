import 'dart:convert';

import 'package:chat/models/login_resp.dart';
import 'package:chat/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:chat/global/environment.dart';
import 'package:chat/models/usuario.dart';

class AuthService with ChangeNotifier {


  User? usuario; // Declaramos la clase usuario necesario para la respuesta del EndPoint de registro.

  bool _autenticando = false;
  final _storage = new FlutterSecureStorage();

  bool get autenticando => this._autenticando;

  set autenticando( bool valor ) {
    this._autenticando = valor;
    notifyListeners();
  }

  // Getters del token de forma estática
  static Future<String?> getToken() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async {
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future<bool> login( String email, String password ) async {
    this.autenticando = true;
    final data = {
      'email'     : email,
      'password'  : password
    };
    final uri = Uri.parse('${ Environment.apiUrl }/login/signin');
    final resp = await http.post(uri, 
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json'
      }
    );
    this.autenticando = false;
    print(resp.statusCode);
    if ( resp.statusCode == 200 ) {
      final loginResponse = loginResponseFromJson( resp.body );

      this.usuario = loginResponse.user;
      print(loginResponse.token);
      await this._guardarToken(loginResponse.token);

      return true;
    } else {
      return false;
    }
  }


  //  Metodo Muestra del que Estaremos Trabajando los demás
  Future register(String name, String email, String password, String phone,int isClient ) async {
    //  this.autenticando = true; provider

    //  Creamos la respuesta con formato de JSON
    final data = {
      'user':{
        'email'     : email,
        'password'  : password,
        'name'      : name,
        'phone'     : phone,
        'isClient'  : isClient
      }
    };

    // Parseamos el endpoint recuperando el endpoint desde el archivo env.
    final uri = Uri.parse('${ Environment.apiUrl }/login/signup');

    final resp = await http.post(uri,
        body: jsonEncode(data),
        headers: { 'Content-Type': 'application/json' }
    );

    //  this.autenticando = false;
    if ( resp.statusCode == 200 ) {

      final loginResponse = loginResponseFromJson( resp.body );

      this.usuario = loginResponse.user;

      await this._guardarToken(loginResponse.token);
      final respBody = jsonDecode(resp.body);
      print(respBody['msg']);
      return true;

    }
    else {

      final respBody = jsonDecode(resp.body);

      return respBody['msg'];
    }
  }

  Future<bool> isLoggedIn() async {

    final token = await this._storage.read(key: 'token') ?? '';

    final uri = Uri.parse('${ Environment.apiUrl }/login/renew');

    final resp = await http.get(uri, 
      headers: { 
        'Content-Type': 'application/json',
        'x-token': token
      }
    );

    if ( resp.statusCode == 200 ) {
      final loginResponse = loginResponseFromJson( resp.body );
      this.usuario = loginResponse.user;
      await this._guardarToken(loginResponse.token);
      return true;
    } else {
      this.logout();
      return false;
    }

  }

  Future _guardarToken( String token ) async {
    return await _storage.write(key: 'token', value: token );
  }

  Future logout() async {
    await _storage.delete(key: 'token');
  }

}

