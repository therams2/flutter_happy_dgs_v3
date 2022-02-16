import 'package:flutter/material.dart';
import 'package:happy_dogs_v2/global/size_config.dart';

import 'components/body.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    return Scaffold(
      body: Body(),
    );
  }
}
