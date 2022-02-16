part of 'map_bloc.dart';

@immutable
abstract class MapaEvent {}

class OnMapaListo extends MapaEvent{} // Significa que el mapa esta cargado

class OnMarcarRecorrido extends MapaEvent{}

class OnNuevaUbicacion extends MapaEvent{
  final LatLng? ubicacion;
  OnNuevaUbicacion(this.ubicacion);

}



