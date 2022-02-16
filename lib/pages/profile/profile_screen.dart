import 'package:flutter/material.dart';
import 'package:happy_dogs_v2/global/constants.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Perfil"),
          backgroundColor: kPrimaryColor),
      body: Body(),
    );
  }
}
