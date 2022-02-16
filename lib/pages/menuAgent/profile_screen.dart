import 'package:flutter/material.dart';
import 'package:happy_dogs_v2/global/constants.dart';
import 'components/body.dart';

class MenuAgent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Agente"),
          backgroundColor: kPrimaryColor),
      body: Body(),
    );
  }
}
