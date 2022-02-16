import 'package:flutter/material.dart';

import 'package:happy_dogs_v2/components/default_button.dart';
import 'package:happy_dogs_v2/components/form_error.dart';
import 'package:happy_dogs_v2/controllers/pets.dart';
import 'package:happy_dogs_v2/global/constants.dart';
import 'package:happy_dogs_v2/global/size_config.dart';
import 'package:happy_dogs_v2/helpers/mostrar_alerta.dart';
import 'package:happy_dogs_v2/pages/complete_profile/complete_profile_screen.dart';

class RegisterPetsForm extends StatefulWidget {
  @override
  _RegisterPetsFormState createState() => _RegisterPetsFormState();
}

class _RegisterPetsFormState extends State<RegisterPetsForm> {
  final _formKey = GlobalKey<FormState>();
  String? petName;
  String? petAge;
  String? petRace;
  String? petGender;

  bool remember = false;
  final List<String?> errors = [];

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
    final petsPost = PetsController();
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildPetNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPetAgeFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPetGenderFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPetRaceFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Añadir Mascota",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                  final registroOk = await petsPost.register(
                      petName!,
                      petAge!,
                      petRace!,
                      petGender!,
                      18
                  );
                  if (registroOk == true) {
                    //entramos
                    mostrarAlerta(context, "Registro correcto", "Correcto");
                  } else {
                    //mostramos alerta
                    mostrarAlerta(context, "Registro incorrecto",
                        "Cambia el nombre de la mascota");
                  }
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPetNameFormField() {
    return TextFormField(
      onSaved: (newValue) => petName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamePetNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamePetNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Nombre de la Mascota",
        hintText: "Introduce el nombre de la Mascota",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.pets),
      ),
    );
  }

  TextFormField buildPetAgeFormField() {
    return TextFormField(
      onSaved: (newValue) => petAge = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAgePetNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAgePetNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Edad de la Mascota",
        hintText: "Introduce una Edad",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.calendar_today),
      ),
    );
  }

  TextFormField buildPetRaceFormField() {
    return TextFormField(
      onSaved: (newValue) => petRace = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kRacePetNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kRacePetNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Raza de la Mascota",
        hintText: "Introduce una raza",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.workspaces_filled),
      ),
    );
  }

  TextFormField buildPetGenderFormField() {
    return TextFormField(
      onSaved: (newValue) => petGender = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kGenderPetNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kGenderPetNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Sexo de la Mascota",
        hintText: "Selecciona un sexo",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.sports_baseball_sharp),
      ),
    );
  }
}
