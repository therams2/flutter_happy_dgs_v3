import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat/services/auth_service.dart';

import 'package:chat/helpers/mostrar_alerta.dart';

import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:chat/widgets/boton_azul.dart';



class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            //height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logo( titulo: 'Registro' ),
                _Form(),
                Labels( 
                  ruta: 'login',
                  titulo: '¿Ya tienes una cuenta?',
                  subTitulo: 'Ingresa ahora!',
                ),

                Text('Términos y condiciones de uso', style: TextStyle( fontWeight: FontWeight.w200 ),)

              ],
            ),
          ),
        ),
      )
   );
  }
}



class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {

  final nameCtrl   = TextEditingController();
  final phoneCtrl  = TextEditingController();
  final emailCtrl  = TextEditingController();
  final passCtrl   = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Provider
    final authService = Provider.of<AuthService>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric( horizontal: 50 ),
       child: Column(
         children: <Widget>[

           CustomInput(
             icon: Icons.perm_identity,
             placeholder: 'Nombre',
             keyboardType: TextInputType.text,
             textController: nameCtrl,
           ),

           CustomInput(
             icon: Icons.add_call,
             placeholder: 'Teléfono',
             keyboardType: TextInputType.number,
             textController: phoneCtrl,
           ),

           CustomInput(
             icon: Icons.add_call,
             placeholder: 'Apellido Paterno',
             keyboardType: TextInputType.text,
             textController: phoneCtrl,
           ),

           CustomInput(
             icon: Icons.mail_outline,
             placeholder: 'Correo',
             keyboardType: TextInputType.emailAddress,
             textController: emailCtrl,
           ),

           CustomInput(
             icon: Icons.lock_outline,
             placeholder: 'Contraseña',
             textController: passCtrl,
             isPassword: true,
           ),

           CustomButton(
             text: 'Crear cuenta',
             onPressed: authService.autenticando ? () => {} : () async {  // Despues del signo de ? Hace una de las dos funciones
               print(nameCtrl.text);
               print(emailCtrl.text);
               print(passCtrl.text);
               print(phoneCtrl.text);

               final registroOk = await authService.register(
                   nameCtrl.text.trim(),
                   emailCtrl.text.trim(),
                   passCtrl.text.trim(),
                   phoneCtrl.text.trim(),1);

               if ( registroOk == true ) {

                 print("Correcto");
                 //Navigator.pushReplacementNamed(context, 'usuarios');
               } else {
                 print("incorrecto");
                 mostrarAlerta(context, 'Registro incorrecto', registroOk );
               }
             },
           )
         ],
       ),
    );
  }
}
