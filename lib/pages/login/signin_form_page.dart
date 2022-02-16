import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:happy_dogs_v2/menu_mapa.dart';
import 'package:happy_dogs_v2/helpers/alert_waiting.dart';
import 'package:happy_dogs_v2/services/auth_service.dart';
import 'package:happy_dogs_v2/widgets/btn_custom.dart';
import 'package:happy_dogs_v2/widgets/custom_input.dart';

class FormularioLogin extends StatefulWidget {
  const FormularioLogin({Key? key}) : super(key: key);

  @override
  _FormularioLoginState createState() => _FormularioLoginState();
}

class _FormularioLoginState extends State<FormularioLogin> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context,
        listen: false); //debajo del build se podra redibujar
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          Container(margin: EdgeInsets.only(top: 20.0)),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textController: passCtrl,
            isPassword: true,
          ),
          Container(margin: EdgeInsets.only(top: 20.0)),
          btn_custom(
              text: 'Ingrese',
              onPressed: () async {
                final loginOk = await authService.login(
                    emailCtrl.text.trim(), passCtrl.text.trim());
                if (loginOk) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => MenuMapa()),
                    (route) => false,
                  );
                } else {
                  mostrarEspere(
                      context, "Login Incorrecto", "Revisa tus credenciales");
                }
              })
        ],
      ),
    );
  }
}
