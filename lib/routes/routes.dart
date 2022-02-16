import 'package:flutter/material.dart';
import 'package:happy_dogs_v2/menu_mapa.dart';
import 'package:happy_dogs_v2/pages/calendar/calendar.dart';

import 'package:happy_dogs_v2/pages/complete_profile/components/complete_profile_form.dart';
import 'package:happy_dogs_v2/pages/login/loading_page.dart';
import 'package:happy_dogs_v2/pages/login/signin_page.dart';
import 'package:happy_dogs_v2/pages/menuAgent/profile_screen.dart';
import 'package:happy_dogs_v2/pages/register_pets/register_pet_screen.dart';
import 'package:happy_dogs_v2/pages/sign_up/sign_up_screen.dart';
import 'package:happy_dogs_v2/pages/splash/splash_screen.dart';



final Map<String, Widget Function(BuildContext)> appRoutes = {
  'login'               : ( context )   => LoginPage(),
  'loading'             : ( context )   => LoadingPage(),
  'register'            : ( context )   => SignUpScreen(),
  'completeProfile'     : ( context )   => CompleteProfileForm(),
  'register_pets'       : ( context )   => RegisterPetsScreen(),
  'spash'               : ( context )   => SplashScreen(),
  'maps'                : ( context )   => MenuMapa(),
  'calendar'            : ( context )   => Calendar(),
  'menuagente'          : ( context )   => MenuAgent()
};


