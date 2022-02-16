import 'package:flutter/material.dart';
import 'package:happy_dogs_v2/global/constants.dart';
import 'package:happy_dogs_v2/global/size_config.dart';
import 'package:happy_dogs_v2/pages/register_pets/components/body.dart';
import 'package:happy_dogs_v2/widgets/btn_navbar.dart';


class RegisterPetsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(title: Text("Nueva mascota"), backgroundColor: kPrimaryColor),
      body: Body(),
    );
  }
}
