import 'package:animal_vax/global_utilities/general_field.dart';
import 'package:animal_vax/registration/utilities/register_widget.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pet Owner Registration"
        ),
        centerTitle: true,
      ),
      body: RegisterWidget()
    );
  }
}
