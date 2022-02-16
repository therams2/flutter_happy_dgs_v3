import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:happy_dogs_v2/bloc/map/map_bloc.dart';
import 'package:happy_dogs_v2/bloc/my_ubication/my_ubication_bloc.dart';
import 'package:happy_dogs_v2/helpers/mostrar_alerta.dart';
import 'package:happy_dogs_v2/widgets/btn_navbar.dart';
import 'package:happy_dogs_v2/widgets/custom_appBar.dart';
import 'package:happy_dogs_v2/widgets/widgets.dart';

class MapaPage extends StatefulWidget  {
  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> with  WidgetsBindingObserver{
  Future<bool> estadoGPS() async {
    final gpsActivo = await Geolocator.isLocationServiceEnabled();
    if (gpsActivo) {
      return true;
    } else {
      return false;
    }
  }

  // Iniciamos el mapa con los parametros iniciales del Bloc
  @override
  void initState() {

    // Aun no iniciamos el seguimiento
    // context.read<MyUbicationBloc>().iniciarSeguimiento();
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  // Nunca la ocupamos pero es buena practica
  @override
  void dispose() {
    //context.read<MyUbicationBloc>().cancelarSeguimiento();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mapaBloc = BlocProvider.of<MapaBloc>(context);
    return Scaffold(
      appBar: CustomAppBar(""),
      bottomNavigationBar: BtnNavbar(),
      body: Stack(
        children: [
          BlocBuilder<MyUbicationBloc, MyUbicationState>(
              builder: (_, state) => crearMapa(state)), // Enviamos solo el state no  necesitamos el context
        ],
      ),

      // Boton flotante
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BlocBuilder<MyUbicationBloc, MyUbicationState>(builder: ( _ , state) {
            if (state.statusFollow == false) {
              //  Si es true inicia el proceso de seguimiento
              return BtnUbicacion(
                  icono: Icon(Icons.not_started, color: Colors.black87),
                  onPressed: () async {
                    //  Si es falso inicializa el seguimiento

                    final status = await estadoGPS();

                    if (status) {
                      context.read<MyUbicationBloc>().iniciarSeguimiento(context);

                      //  Recuperamos la ultima ubicacion
                      final destino;
                      destino = state.ubication;


                      print("ACTIVADO ${destino}");
                      mapaBloc.moverCamara(destino);
                    } else {
                      print("DESACTIVADO");
                      mostrarAlerta(context, "Por favor", "Active el GPS");
                    }
                  });
            } else {
              print("entro al false");
              //  Si es false detiene el seguimiento
              return BtnUbicacion(
                  icono: Icon(Icons.stop, color: Colors.black87),
                  onPressed: () async {
                    //  Si es falso cancela el seguimiento
                      context.read<MyUbicationBloc>().cancelarSeguimiento();
                  });
            }}),
          //BtnMiRuta(),
          BtnTarifas(),
          BtnCalendar(),
        ],
      ),
    );
  }

  // Creamos el Mapa pero con las coordenadas iniciales de Morelia

  Widget crearMapa(MyUbicationState state) {
    print("${state.ubication} ${state.existUbication}");

    final mapaBloc = BlocProvider.of<MapaBloc>(
        context); //  Hacemos referencia a nuestro bloc del mapa
    //mapaBloc.add(OnNuevaUbicacion(state.ubication));

    LatLng initialCoordinate;
    // Asignamos las coordenadas para la vista principal
    if (!state.existUbication) {
      initialCoordinate = const LatLng(19.703305, -101.196041);
    } else {
      initialCoordinate = state.ubication!;
    }
    // Si existe la ubicacion se le asignara las coordenadas del gps
    // Camera position se refiere a la posicion de la camara utilizando un parametro inicial, despues se ira cambiando
    final cameraPosition = CameraPosition(
        target: initialCoordinate, // El mapa siempre va a cargar
        zoom: 15);
    return GoogleMap(
      initialCameraPosition: cameraPosition,
      compassEnabled: true,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: false,
      //onMapCreated            : (GoogleMapController controller ) => mapaBloc.initMapa,
      onMapCreated: mapaBloc.initMapa,
      //polylines: mapaBloc.state.polylines.values.toSet(),
    );
  }
}
