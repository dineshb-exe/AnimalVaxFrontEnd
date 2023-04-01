import 'dart:ui';

import 'package:animal_vax/login/utilities/login_header.dart';
import 'package:animal_vax/login/utilities/general_field.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  String type="Doc";
  LoginWidget({Key? key, required this.type}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              LoginHeader(
                type: "${widget.type}",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              GeneralField(placeholder: "Username",),
              GeneralField(placeholder: "Password"),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width*0.3,MediaQuery.of(context).size.height*0.05),
                ),
                child: const Text(
                  "Submit",
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
