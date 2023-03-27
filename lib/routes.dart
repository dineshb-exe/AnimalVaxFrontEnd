import 'package:animal_vax/login/login_doctor.dart';
import 'package:flutter/material.dart';
import 'login/login_main.dart';

class RouteManager{
  static const String loginPage = '/';
  static const String loginDoctor = '/loginDoctor';
  static const String loginPet = '/thirdPage';

  static Route<dynamic> generateRoute(RouteSettings settings){
    var valuesReceived;
    if(settings.arguments!=null){
      valuesReceived = settings.arguments as Map<String, dynamic>;
    }
    switch(settings.name){
      case loginPage:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
      case loginDoctor:
        return MaterialPageRoute(
          builder: (context) => const LoginDoc(),
        );
      case loginPet:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );
      default:
        throw const FormatException('Routing la error irukku');
    }
  }
}