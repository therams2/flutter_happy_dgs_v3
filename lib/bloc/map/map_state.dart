// Manipula el estado del mapa
part of 'map_bloc.dart';

@immutable
class MapaState {
  // Detectar cuando podamos usar el mapa
  final bool mapaListo;
  final bool dibujarRecorrido;
  final Map<String, Polyline> polylines;

  MapaState(
      {
        this.mapaListo                = false,   // Si esta en false no se puede hacer nada en el mapa
        this.dibujarRecorrido         = false,
        Map<String, Polyline>? polylines
      }) : this.polylines = polylines ?? new Map();

  MapaState copyWith(
      {
        bool? mapaListo,
        bool? dibujarRecorrido,
        Map<String, Polyline>? polylines
      }) =>  new MapaState(
        mapaListo         : mapaListo         ?? this.mapaListo,
        dibujarRecorrido  : dibujarRecorrido  ?? this.dibujarRecorrido,
        polylines         : polylines         ?? this.polylines,
      );
}
