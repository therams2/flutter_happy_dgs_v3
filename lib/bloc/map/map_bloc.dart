import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart' show Colors;

import 'package:google_maps_flutter/google_maps_flutter.dart';

//  Unico archivo con todas las clases
part 'map_event.dart';
part 'map_state.dart';

class MapaBloc extends Bloc<MapaEvent, MapaState> {
  MapaBloc() : super(new MapaState());

  // Controlador del mapa
  GoogleMapController? _mapController;

  //PolyLine
  Polyline _miRuta = new Polyline(
      polylineId: PolylineId('mi_ruta'), width: 4, color: Colors.black87);


  // Iniciamos el controlador
  void initMapa(GoogleMapController controller) {
    //  manejamos aqui el constrolador
    if (!state.mapaListo) { //  verificar que el mapa este listo y no llamarlo 2 veces
      this._mapController = controller;
      //this._mapController.setMapStyle(mapStyle);
      add(OnMapaListo()); //  Cambiamos el estado del mapa MapaListo = True
    }
  }

  //  mover camara a la posicion actual
  Future<void> moverCamara(LatLng destino) async {
    print("EL DESTINO ES");
    print(destino);
    if(destino==null){
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      final nuevaUbicacion = LatLng(
          position.latitude, position.longitude);
      final cameraUpdate = CameraUpdate.newLatLngZoom(nuevaUbicacion, 16);
      this._mapController?.animateCamera(cameraUpdate);
    }else{
    final cameraUpdate = CameraUpdate.newLatLngZoom(destino, 16);
    this._mapController?.animateCamera(cameraUpdate);
  }
  }

  @override
  Stream<MapaState> mapEventToState(MapaEvent event) async* {
    if (event is OnMapaListo) {
      print("mapa listo: 10 metros");
      yield state.copyWith(mapaListo: true); //  Emitimos un nuevo estado
    }

    else if (event is OnNuevaUbicacion) {
      /* print("Cambio la ubicacion del gps ${event.ubicacion}");
      //aqui recibimos la nueva ubicacion

      List<LatLng> points = [...this._miRuta.points, LatLng(event.ubicacion?.latitude, event.ubicacion?.longitude)];

      print(this._miRuta.points);
      this._miRuta = this._miRuta.copyWith(pointsParam: points);
      final currentPolylines = state.polylines;
      currentPolylines['mi_ruta'] = this._miRuta;
      yield state.copyWith(polylines: currentPolylines);
    }
    else if (event is OnMarcarRecorrido) {

      //Primera vez es true
      if (!state.dibujarRecorrido) {
        this._miRuta = this._miRuta.copyWith(colorParam: Colors.black87);
      }
      else {
        this._miRuta = this._miRuta.copyWith(colorParam: Colors.transparent);
      }


      final currentPolylines = state.polylines;
      currentPolylines['mi_ruta'] = this._miRuta;
      yield state.copyWith(
          dibujarRecorrido: !state.dibujarRecorrido,
          polylines: currentPolylines);
    }*/
  }
}}
