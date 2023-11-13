import 'dart:convert';

import 'package:animal_vax/login/user_model.dart';
import 'package:http/http.dart';

class DashboardServices {
  Future<Map<String, dynamic>> feedPets(User user) async{
    try {
      final response = await get(
        Uri.parse("https://tnpetvac.onrender.com/pets/"),
      );
      return {
        "status": "Success",
        "data": jsonDecode(response.body)
      };
    }
    catch(e){
      return {
        "status": "Error",
        "Message": e
      };
    }
  }
}