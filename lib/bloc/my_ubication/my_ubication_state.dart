part of 'my_ubication_bloc.dart';

// No lo podemos mutar tenemos que hacer una copia con el CopyWith
@immutable
class MyUbicationState {
// Point por default
  final bool following;
  final bool existUbication;
  final LatLng? ubication;
  final bool statusFollow;

  MyUbicationState({
    this.following        = true,
    this.existUbication   = false,
    this.ubication,
    this.statusFollow     = false
  });


  // Regresa una nueva instancia de nuestro objeto
  MyUbicationState copyWith(
      {
        bool? following,
        bool? existUbication,
        LatLng? ubication,
        bool? statusFollow
      }) => new MyUbicationState(   // Nueva instancia
      following       : following       ?? this.following,
      existUbication  : existUbication  ?? this.existUbication,
      ubication       : ubication       ?? this.ubication,
      statusFollow    : statusFollow   ?? this.statusFollow
  );
}
