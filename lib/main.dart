import 'package:happy_dogs_v2/routes/routes.dart';
import 'package:happy_dogs_v2/services/auth_service.dart';
import 'package:happy_dogs_v2/services/sign_up_form_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: ( _ ) => SignupService()), //todas las rutas contrendran el provider en sus context

        ChangeNotifierProvider(
            create: ( _ ) => AuthService()), //todas las rutas contrendran el provider en sus context
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HappyDogs',
        initialRoute: 'login',
        routes: appRoutes,
      ),
    );
  }
}
