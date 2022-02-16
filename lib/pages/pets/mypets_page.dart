import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:happy_dogs_v2/global/constants.dart';
import 'package:happy_dogs_v2/global/environment.dart';
import 'package:happy_dogs_v2/models/pets/pet.dart';
import 'package:happy_dogs_v2/models/pets/pet_response.dart';
import 'package:http/http.dart' as http;

class MyPets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mis mascotas"), backgroundColor: kPrimaryColor),
      body: FutureBuilder(
        future: getPets(18),
        builder: (BuildContext context, AsyncSnapshot<PetResponse> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return _ListaPets(snapshot.data!.pet);
          }
        },
      ),
    );
  }

  Future<PetResponse> getPets(int? id) async {
    final data = {
      "id": id,
    };
    final uri = Uri.parse('${Environment.apiUrl}/pets/mypets');
    final resp = await http.post(uri,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    return petResponseFromJson(resp.body);
  }
}

class _ListaPets extends StatelessWidget {
  final List<Pet> pets;
  _ListaPets(this.pets);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: pets.length,
        itemBuilder: (BuildContext context, int i) {
          final pet = pets[i];
          return ListTile(
            leading: const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                  'https://i.ytimg.com/vi/uHG7yNf-4k4/maxresdefault.jpg'),
            ),
            title: Text("${pet.name}"),
            subtitle: Text("Edad: ${pet.age}"),
            trailing: Text("Paseos: ${pet.age}"),
          );
        });
  }
}
