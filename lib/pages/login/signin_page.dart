import 'package:flutter/material.dart';

import 'package:happy_dogs_v2/global/size_config.dart';
import 'package:happy_dogs_v2/pages/login/signin_form_page.dart';
import 'package:happy_dogs_v2/widgets/labels.dart';
import 'package:happy_dogs_v2/widgets/logo.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(0.0),
            child: SafeArea(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    SizedBox(height: 70),
                    Logo(titulo: 'Happy Dogs'),
                    FormularioLogin(),
                    SizedBox(height: 5),
                    Labels(
                      ruta: 'register',
                      titulo: '¿No tienes cuenta?',
                      subTitulo: 'Crea una ahora!',
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Términos y condiciones de uso',
                      style: TextStyle(fontWeight: FontWeight.w200),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
