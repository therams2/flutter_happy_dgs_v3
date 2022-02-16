import 'dart:convert';
import 'package:happy_dogs_v2/global/environment.dart';
import 'package:http/http.dart' as http;

class PetsController {
  //Registro de Mascota
  Future register(String name, String age, String race, String gender,int? id_user) async {
    final data = {
      'name'   : name,
      'age'    : age,
      "race"   : race,
      "gender" : gender,
      "user_id": id_user
    };
    final uri = Uri.parse('${Environment.apiUrl}/pets/register');
    final resp = await http.post(uri, body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    if (resp.statusCode == 200) {
      //final loginResponse = registerResponseFromJson(resp.body);
      // el future puede regresar un booleano o un string
      return true;
    } else {
      //en caso de que el email ya exista
      //final respBody = jsonDecode(resp.body);
      //  return respBody['msg'];
    }
  }
}

