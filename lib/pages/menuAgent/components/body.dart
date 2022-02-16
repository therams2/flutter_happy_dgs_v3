import 'package:flutter/material.dart';
import 'package:happy_dogs_v2/helpers/helpers.dart';
import 'package:happy_dogs_v2/pages/manage_travels/manege_travel.dart';
import 'package:happy_dogs_v2/pages/pets/mypets_page.dart';
import 'package:happy_dogs_v2/pages/profile/count/mycount_page.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(width: 10,),
                ProfilePic(),
                SizedBox(width: 10,),
                Text("Bienvenido Ramiro Javier"),
              ],
            ),
          ),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Paseos Realizados",
            icon: "assets/icons/Star Icon.svg",
            press: () => {
              Navigator.push(context, navegarMapaFadeIn(context, Mycount()))
            },
          ),
          ProfileMenu(
            text: "Generar Paseo",
            icon: "assets/icons/Discover.svg",
            press: () =>
                {
                  //Navigator.push(context, navegarMapaFadeIn(context, ManegeTravel()))
                },
          ),
          ProfileMenu(
            text: "Mis paseos",
            icon: "assets/icons/Location point.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
