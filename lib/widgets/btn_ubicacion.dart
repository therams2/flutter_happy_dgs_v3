part of 'widgets.dart';

// Este boton verifica primero el estado del GPS
class BtnUbicacion extends StatelessWidget {
  final Function onPressed;
  final Icon icono;

  const BtnUbicacion({Key? key, required this.icono, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
          icon: icono,
          //icon: Icon(Icons.my_location, color: Colors.black87),
          onPressed:  () => this.onPressed(),
        ),
      ),
    );
  }

  Future<bool> estadoGPS() async {
    final gpsActivo = await Geolocator.isLocationServiceEnabled();
    if (gpsActivo) {
      return true;
    }else{
      return false;
    }
  }
}
