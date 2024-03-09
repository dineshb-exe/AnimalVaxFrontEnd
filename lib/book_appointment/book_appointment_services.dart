import 'dart:convert';

import 'package:animal_vax/book_appointment/hospital_model.dart';
import 'package:animal_vax/book_appointment/vaccine_model.dart';
import 'package:animal_vax/dashboard/dashboard_pet_model.dart';
import 'package:animal_vax/login/post_login_model.dart';
import 'package:animal_vax/login/user_model.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class BookAppointmentServices {
  Future<Map<String, dynamic>> getDoctors(
      {required String latitude, required String longitude, required PostLogin authToken}) async {
    try {
      String sanitizedJwtToken = authToken.jwtToken.replaceAll('"', '');
      final response = await get(Uri.parse(
        "https://tnpetvac.onrender.com/getdoctor/$latitude/$longitude/",
        ),
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
    catch (e) {
      return {
        "status": "Failure",
        "log": e
      };
    }
  }
  Future<Map<String, dynamic>> getVaccines(
      {required PostLogin authToken}) async {
    try {
      String sanitizedJwtToken = authToken.jwtToken.replaceAll('"', '');
      final response = await get(Uri.parse(
        "https://tnpetvac.onrender.com/vaccines/",
      ),
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
    catch (e) {
      return {
        "status": "Failure",
        "log": e
      };
    }
  }
  Future<Map<String, dynamic>> addAppointment(
      {required PostLogin authToken, required User user, required DashboardPet pet, required Hospital hospital, required Vaccine vaccine}) async {
    //try {
      String sanitizedJwtToken = authToken.jwtToken.replaceAll('"', '');
      final DateTime now = DateTime.now();
      final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
      final String dateFormatted = dateFormatter.format(now);
      final DateFormat timeFormatter = DateFormat('HH:mm:ss');
      final String timeFormatted = timeFormatter.format(now);
      final response = await post(
        Uri.parse(
          "https://tnpetvac.onrender.com/appointments/create/",
        ),
        headers: <String,String>{
          'Authorization': "Bearer $sanitizedJwtToken"
        },
        body: <String,dynamic>{
          "date": dateFormatted,
          "time": timeFormatted,
          "request_status": "P",
          "owner_id": "${user.id}",
          "vaccine_id": "${vaccine.id}",
          "doctor_id": "${hospital.id}",
          "pet_id": "${pet.id}"
        }
      );
      return {
        "status": "Success",
        "data": jsonDecode(response.body)
      };
    // }
    // catch (e) {
    //   return {
    //     "status": "Failure",
    //     "log": e
    //   };
    // }
  }
}