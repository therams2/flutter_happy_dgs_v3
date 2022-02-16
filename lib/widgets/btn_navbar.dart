import 'package:flutter/material.dart';
import 'package:happy_dogs_v2/global/constants.dart';
import 'package:happy_dogs_v2/helpers/helpers.dart';
import 'package:happy_dogs_v2/pages/maps/mapa_page.dart';
import 'package:happy_dogs_v2/pages/profile/profile_screen.dart';
import 'package:happy_dogs_v2/pages/register_pets/register_pet_screen.dart';


class BtnNavbar extends StatelessWidget {
  const BtnNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0; //New
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: kPrimaryColor,
      selectedItemColor: kSecondaryColor,
      unselectedItemColor: Colors.white,
      selectedFontSize: 14,
      unselectedFontSize: 14,

      onTap: (value) {
        switch(value){
          case 0:
            Navigator.push(context, navegarMapaFadeIn(context, MapaPage() ));
            break;
          case 1:
            Navigator.push(context, navegarMapaFadeIn(context, RegisterPetsScreen() ));
            break;
          case 2:break;
          case 3:
            Navigator.push(context, navegarMapaFadeIn(context, ProfileScreen() ));
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          title: Text('Cart'),
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          title: Text('Cart'),
          icon: Icon(Icons.pets_sharp),
        ),
        BottomNavigationBarItem(
          title: Text('Cart'),
          icon: Icon(Icons.shopping_cart),
        ),
        BottomNavigationBarItem(
          title: Text('Cart'),
          icon: Icon(Icons.person_outline),
        ),],
    );
  }


}
