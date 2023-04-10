import 'package:flutter/material.dart';

void snackbar(BuildContext context, String value){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      value,
      textAlign: TextAlign.center,
    ),  
  ));
}