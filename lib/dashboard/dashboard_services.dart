import 'dart:convert';

import 'package:animal_vax/login/post_login_model.dart';
import 'package:animal_vax/login/user_model.dart';
import 'package:http/http.dart';

class DashboardServices {
  Future<Map<String, dynamic>> feedPets({required User user, required PostLogin authToken}) async{
    try {
    String url = "https://tnpetvac.onrender.com/petsbyowner/${user.id}/";
    String sanitizedJwtToken = authToken.jwtToken.replaceAll('"', '');
    final response = await get(
        Uri.parse(url),
        headers: <String,String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $sanitizedJwtToken"
        }
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