part of 'my_ubication_bloc.dart';

@immutable
abstract class MyUbicationEvent {}

class OnUbicationChange extends MyUbicationEvent {
  //  Evento que se ejecuta cuando cambia la ubicacion

  final  LatLng ubication;
  OnUbicationChange(this.ubication);

}

class OnFollowUbicationChange extends MyUbicationEvent{
  final bool followUbication;
  OnFollowUbicationChange(this.followUbication);
}