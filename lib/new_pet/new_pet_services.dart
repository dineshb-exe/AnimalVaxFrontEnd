import 'dart:convert';

import 'package:animal_vax/new_pet/pet_model.dart';
import 'package:http/http.dart';

class NewPetServices {
  Future<Map<String, dynamic>> addPet(Pet pet) async{
    try {
      final response = await post(
          Uri.parse("https://tnpetvac.onrender.com/pets/create/"),
          headers: {
            "content-type": "application/json",
          },
          body: jsonEncode(pet.toJson()));
      if (response.statusCode == 200) {
        return {
          'status': "Success",
          'data': response.body,
        };
      } else {
        return {
          'status': "Failure",
          'message': "Invalid Credentials",
        };
      }
    }
    catch (e){
      return {
        'status': "Failure",
        'message': e,
      };
    }
  }
}