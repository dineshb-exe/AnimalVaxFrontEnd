import 'package:animal_vax/dashboard/dashboard_main.dart';
import 'package:animal_vax/location/location_main.dart';
import 'package:animal_vax/login/utilities/login_widget.dart';
import 'package:animal_vax/registration/confirmation.dart';
import 'package:animal_vax/registration/reg_main.dart';
import 'package:flutter/material.dart';
import 'login/login_main.dart';

class RouteManager{
  static const String loginPage = '/';
  static const String register = '/register';
  static const String registerConfirmation = '/registerConfirmation';
  static const String location = '/location';
  static const String dashboard = '/dashboard';

  static Route<dynamic> generateRoute(RouteSettings settings){
    var valuesReceived;
    if(settings.arguments!=null){
      valuesReceived = settings.arguments as Map<String, dynamic>;
    }
    switch(settings.name){
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
          builder: (context) => LocationChoice(
            authToken: valuesReceived["authToken"],
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
          ),
        );
      default:
        throw const FormatException('Routing la error irukku');
    }
  }
}