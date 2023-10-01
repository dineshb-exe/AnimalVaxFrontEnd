import 'package:flutter/material.dart';

void customSnackbar(BuildContext context, String value){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      value,
      textAlign: TextAlign.center,
    ),  
  ));
}