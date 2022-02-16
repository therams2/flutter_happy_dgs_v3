import 'dart:convert';
import 'package:happy_dogs_v2/global/constants.dart';
import 'package:happy_dogs_v2/global/environment.dart';
import 'package:happy_dogs_v2/models/users/user.dart';
import 'package:happy_dogs_v2/models/users/user_get_response.dart';
import 'package:happy_dogs_v2/widgets/btn_custom.dart';
import 'package:happy_dogs_v2/widgets/custom_input.dart';
import 'package:happy_dogs_v2/widgets/labels.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Mycount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Mi cuenta"), backgroundColor: kPrimaryColor),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              _Form(),
              SizedBox(height: 20),
            ],
          ),
        ));
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  User? usuario ;

  final nameCtrl = TextEditingController();
  final ageCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final addressCtrl = TextEditingController();

  Future<bool> getData(int? id) async {
    final data = {
      "id": id,
    };

    final uri = Uri.parse('${ Environment.apiUrl }/profile/data');
    print(uri);
    final resp = await http.post(
        uri,
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json'
        });

    if (resp.statusCode == 200) {
      final loginResponse = userGetResponseFromJson(resp.body);
      this.usuario = loginResponse.user;
      nameCtrl.text = usuario!.name.toString();
      emailCtrl.text = usuario!.email.toString();
      ageCtrl.text = usuario!.dateOfBirth.toString().substring(0,10);
      addressCtrl.text = "Lomas de Santiaguito";
      passwordCtrl.text = usuario!.password;
      return true;
    } else {
      print("no respuesta");
      return false;
    }

  }
  @override
  Widget build(BuildContext context) {
    getData(18);
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.perm_identity,
            placeholder: 'Nombre',
            keyboardType: TextInputType.text,
            textController: nameCtrl,
          ),
          Container(margin: EdgeInsets.only(top: 20.0)),
          CustomInput(
            icon: Icons.merge_type,
            placeholder: 'Dirección',
            keyboardType: TextInputType.text,
            textController: addressCtrl,
          ),
          Container(margin: EdgeInsets.only(top: 20.0)),
          CustomInput(
            icon: Icons.calendar_today,
            placeholder: 'Fecha de Nacimiento',
            keyboardType: TextInputType.emailAddress,
            textController: ageCtrl,
          ),
          Container(margin: EdgeInsets.only(top: 20.0)),
          CustomInput(
            icon: Icons.email,
            placeholder: 'Email',
            keyboardType: TextInputType.text,
            textController: emailCtrl,
          ),
          Container(margin: EdgeInsets.only(top: 20.0)),
          //CustomInput(
            //icon: Icons.admin_panel_settings_sharp,
            //placeholder: 'New Password',
            //keyboardType: TextInputType.text,
            //textController: passwordCtrl,
          //),
          Container(margin: EdgeInsets.only(top: 20.0)),
          btn_custom(
            text: 'Guardar Cambios',
            onPressed: (){
              Navigator.pop(context);
            }

          ),
          SizedBox(height: 5),
          const Labels(
            ruta: 'register',
            titulo: '¿Quieres cambiar tu contraseña?',
            subTitulo: 'Cambiar ahora',
          ),

        ],
      ),
    );
  }
}
