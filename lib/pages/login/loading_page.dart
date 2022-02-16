import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:happy_dogs_v2/menu_mapa.dart';
import 'package:happy_dogs_v2/global/size_config.dart';
import 'package:happy_dogs_v2/pages/splash/splash_screen.dart';
import 'package:happy_dogs_v2/services/auth_service.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: ( context, snapshot) {
          return const Center(child: Text('Espera...'));
        },
      ),
    );
  }

  Future checkLoginState( BuildContext context ) async {

    final authService = Provider.of<AuthService>(context, listen: false);

    final autenticado = await authService.isLoggedIn();

    print("ESTADO${autenticado}");
    if ( autenticado ) {
      print("LOGEADO");
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: ( _, __, ___ ) => MenuMapa(),
              transitionDuration: Duration(milliseconds: 0)
          )
      );
    } else {
      print("NO LOGEADO");
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: ( _, __, ___ ) => SplashScreen(),
              transitionDuration: Duration(milliseconds: 0)
          )
      );
    }
  }
}