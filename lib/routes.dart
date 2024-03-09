import 'package:animal_vax/book_appointment/book_appointment_main.dart';
import 'package:animal_vax/dashboard/dashboard_main.dart';
import 'package:animal_vax/location/location_main.dart';
import 'package:animal_vax/new_pet/new_pet_main.dart';
import 'package:animal_vax/registration/confirmation.dart';
import 'package:animal_vax/registration/doc_register_main.dart';
import 'package:animal_vax/registration/reg_main.dart';
import 'package:flutter/material.dart';
import 'login/login_main.dart';

class RouteManager {
  static const String loginPage = '/';
  static const String register = '/register';
  static const String registerConfirmation = '/registerConfirmation';
  static const String location = '/location';
  static const String dashboard = '/dashboard';
  static const String newPet = '/newPet';
  static const String docRegister = '/docRegister';
  static const String bookAppointment = '/bookAppointment';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Map<String, dynamic>? valuesReceived;
    if (settings.arguments != null) {
      valuesReceived = settings.arguments as Map<String, dynamic>;
    }
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(
          builder: (context) => const Login(),
        );
      case register:
        return MaterialPageRoute(
          builder: (context) => const Register(),
        );
      case location:
        return MaterialPageRoute(
          builder: (context) => LocationMain(
            authToken: valuesReceived!["authToken"],
            userInfo: valuesReceived["userInfo"],
          ),
        );
      case registerConfirmation:
        return MaterialPageRoute(
          builder: (context) => const RegConfirmation(),
        );
      case dashboard:
        return MaterialPageRoute(
          builder: (context) => Dashboard(
            authToken: valuesReceived!["authToken"],
            userInfo: valuesReceived["userInfo"],
            latitude: valuesReceived["latitude"],
            longitude: valuesReceived["longitude"],
          ),
        );
      case newPet:
        return MaterialPageRoute(
          builder: (context) => NewPetMain(
            authToken: valuesReceived!['authToken'],
            user: valuesReceived['user']
          ),
        );
      case docRegister:
        return MaterialPageRoute(builder: (context) => const DocRegister());
      case bookAppointment:
        return MaterialPageRoute(builder: (context) => BookAppointment(pet: valuesReceived!["pet"], authToken: valuesReceived["authToken"], user: valuesReceived["user"], latitude: valuesReceived["latitude"], longitude: valuesReceived["longitude"],),);
      default:
        throw const FormatException('Routing la error irukku');
    }
  }
}
