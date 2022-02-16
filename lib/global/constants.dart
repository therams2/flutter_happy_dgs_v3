import 'package:flutter/material.dart';
import 'package:happy_dogs_v2/global/size_config.dart';


const kPrimaryColor =      Color(0xFFFFDE59);
const kPrimaryLightColor =  Color(0xFFC9E8ED);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);


const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError        = "Por favor introduce un Email";
const String kInvalidEmailError     = "Por Favor Introduce un Email Valido";
const String kPassNullError         = "Por Favor Introduce Una Contraseña";
const String kShortPassError        = "La Contraseña es Demasiado Corta";
const String kMatchPassError        = "Las Contraseñas no Coinciden";
const String kNamelNullError        = "Por Favor Introduce Tu Nombre";
const String kPhoneBirthDayNullError  = "Por Favor Introduce Tu Fecha de Nacimiento";
const String kPhoneNumberNullError  = "Por Favor Introduce Tu Numero Telefonico";
const String kAddressNullError      = "Por Favor Introduce tu Direccion";

// Form Error Pets

const String kNamePetNullError ="Introuce el nombre de tu mascota";
const String kAgePetNullError ="Introuce la edad de tu mascota";
const String kGenderPetNullError ="Introuce el sexo de tu mascota";
const String kRacePetNullError ="Introuce la raza de tu mascota";


final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
