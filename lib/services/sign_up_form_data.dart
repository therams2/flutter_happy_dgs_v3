import 'package:flutter/material.dart';

class SignupService  with ChangeNotifier{
  String? _email;
  String? _pass;
  set setPass(String pass){
    _pass = pass;
    notifyListeners();
  }

  set setEmail(String email){
    _email = email;
    notifyListeners();
  }
  get getEmail => _email;
  get getPass => _pass;
}