import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:happy_dogs_v2/helpers/alert_waiting.dart';
import 'package:meta/meta.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

part 'my_ubication_event.dart';
part 'my_ubication_state.dart';

class MyUbicationBloc extends Bloc<MyUbicationEvent, MyUbicationState>{

  // Estanciamos el bloc con los parametros por default de la clase state
  MyUbicationBloc() : super(MyUbicationState());  //  Hereda todos los metodos y atributos de la clase padre e inicializa el constructor
  bool? statusGPS;
  StreamSubscription<Position>? positionStream;

  // Metodo para detecta la ubicacion actual y dibujar en el Mapa
  // Iniciamos el Geolocator solo una vez.
  void iniciarSeguimiento(BuildContext context) async {
    //  Verificamos el estado del GPS
    // Escuchamos todos los cambios en la posicion
    positionStream = Geolocator.getPositionStream(
        desiredAccuracy:
        LocationAccuracy.high,
        distanceFilter: 10).listen(_onData,onError: _onError);
    if(statusGPS == false){
      mostrarEspere(context, "titulo", "activa el gps");
    }
  }
  void _onData(Position position) {
    statusGPS = true;
          final nuevaUbicacion = LatLng(position.latitude, position.longitude);
          add(OnUbicationChange(nuevaUbicacion));
          add(OnFollowUbicationChange(true));
  }
  void _onError(dynamic error) {
    print(error);
  }

  void pausarSeguimiento(){
    this.positionStream?.pause();
  }
  void continuarSeguimiento(){
    this.positionStream?.resume();
  }
  // Dejamos de seguir al usuario
  void cancelarSeguimiento() {
   this.positionStream?.cancel();
  }

  // Mandamos a llamar el evento
  @override
  Stream<MyUbicationState> mapEventToState( MyUbicationEvent event ) async* {
    print(event);
    if ( event is OnUbicationChange ) {// Significa si cambia
     print("Existe cambio");
      yield state.copyWith(
        existUbication: true,
        ubication: event.ubication,
      );
    }
    if ( event is OnFollowUbicationChange ) { // Significa si cambia
      yield state.copyWith(
        statusFollow: true,
      );
    }
  }
}
