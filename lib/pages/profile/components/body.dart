import 'package:flutter/material.dart';
import 'package:happy_dogs_v2/helpers/helpers.dart';
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
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Mi cuenta",
            icon: "assets/icons/User Icon.svg",
            press: () => {
              Navigator.push(context, navegarMapaFadeIn(context, Mycount()))
            },
          ),
          ProfileMenu(
            text: "Mis mascotas",
            icon: "assets/icons/Heart Icon.svg",
            press: () =>
                {Navigator.push(context, navegarMapaFadeIn(context, MyPets()))},
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
