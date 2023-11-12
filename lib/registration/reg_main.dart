import 'package:animal_vax/registration/utilities/register_widget.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pet Owner Registration"
        ),
        centerTitle: true,
      ),
      body: const RegisterWidget()
    );
  }
}
