import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_dogs_v2/bloc/map/map_bloc.dart';
import 'package:happy_dogs_v2/pages/maps/acceso_gps_page.dart';
import 'package:happy_dogs_v2/pages/maps/loading_page.dart';
import 'package:happy_dogs_v2/pages/maps/mapa_page.dart';

import 'bloc/my_ubication/my_ubication_bloc.dart';


class MenuMapa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MyUbicationBloc()), // Todo lo relacionado a la ubicacion de la persona
        BlocProvider(create: (_) => MapaBloc()),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: LoadingPage(),
        routes: {
          'mapa'      : ( _ ) => MapaPage(),
          'loading'   : ( _ ) => LoadingPage(),
          'acceso_gps': ( _ ) => AccesoGpsPage(),
        },
      ),
    );
  }
}