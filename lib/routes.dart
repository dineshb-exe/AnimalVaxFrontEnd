import 'package:animal_vax/dashboard/dashboard_main.dart';
import 'package:animal_vax/location/location_main.dart';
import 'package:animal_vax/new_pet/new_pet_main.dart';
import 'package:animal_vax/registration/confirmation.dart';
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

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var valuesReceived;
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
          builder: (context) => Register(),
        );
      case location:
        return MaterialPageRoute(
          builder: (context) => LocationMain(
            authToken: valuesReceived["authToken"],
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
            authToken: valuesReceived["authToken"],
            userInfo: valuesReceived["userInfo"],
          ),
        );
      case newPet:
        return MaterialPageRoute(
          builder: (context) => NewPetMain(
            authToken: valuesReceived['authToken'],
            user: valuesReceived['user']
          ),
        );
      default:
        throw const FormatException('Routing la error irukku');
    }
  }
}
