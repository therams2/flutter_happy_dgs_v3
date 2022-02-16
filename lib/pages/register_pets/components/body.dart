import 'package:flutter/material.dart';
import 'package:happy_dogs_v2/components/socal_card.dart';
import 'package:happy_dogs_v2/global/constants.dart';
import 'package:happy_dogs_v2/global/size_config.dart';
import 'package:happy_dogs_v2/pages/register_pets/components/register_pets_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04), // 4%
                Text("Registar Nueva Mascota", style: headingStyle),
                const Text(
                  "Completa los datos",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                RegisterPetsForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  'Regresa a la pantalla menu',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
