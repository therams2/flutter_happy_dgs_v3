import 'package:flutter/material.dart';
import 'package:happy_dogs_v2/menu_mapa.dart';
import 'package:happy_dogs_v2/widgets/btn_custom.dart';
import 'package:provider/provider.dart';

import 'package:happy_dogs_v2/components/default_button.dart';
import 'package:happy_dogs_v2/components/form_error.dart';
import 'package:happy_dogs_v2/global/constants.dart';
import 'package:happy_dogs_v2/global/size_config.dart';
import 'package:happy_dogs_v2/helpers/mostrar_alerta.dart';
import 'package:happy_dogs_v2/pages/login/signin_page.dart';
import 'package:happy_dogs_v2/services/auth_service.dart';
import 'package:happy_dogs_v2/services/sign_up_form_data.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];
  String? fullName;
  String? birthDay;
  String? phoneNumber;
  DateTime selectedDate = DateTime.now();
  final dateBirthCtrl = TextEditingController();

  Future _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      return picked.toString().substring(0, 10);
    } else {
      return "";
    }
  }



  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final signup_data = Provider.of<SignupService>(context, listen: false);
    final authService = Provider.of<AuthService>(context, listen: false);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
              children:[
                Flexible(
                  child: btn_custom(
                      text: "Seleecionar",
                      onPressed: () async {
                        String fecha = await _selectDate(context);
                        dateBirthCtrl.text = fecha;
                      }),
                ),
                SizedBox(width: getProportionateScreenHeight(30)),
                Flexible(
                    child: buildBirthDayFormField()),
              ]),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continuar",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!
                    .save(); // GUARDA LOS INPUTS EN SUS RESPECTIVAS VARIABLES
                final registroOk = await authService.register(
                    fullName.toString().trim(),
                    signup_data.getEmail,
                    signup_data.getPass,
                    birthDay.toString().trim(),
                    phoneNumber.toString().trim());
                if (registroOk == true) {
                  mostrarAlerta(context, "Registro correcto", "Correcto");

                } else {
                  mostrarAlerta(context, "Registro incorrecto", registroOk);
                }

              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Telefono",
        hintText: "Introduce tu numero telefonico",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.phone),
      ),
    );
  }

  TextFormField buildBirthDayFormField() {
    return TextFormField(
      enabled: false,
      controller: dateBirthCtrl,
      onSaved: (newValue) => birthDay = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneBirthDayNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneBirthDayNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Fecha nacimiento",
        hintText: "Fecha",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.date_range),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => fullName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Nombre Completo",
        hintText: "Introduce tu nombre completo",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.person_add),
      ),
    );
  }
}
