import 'package:animal_vax/login/utilities/login_header.dart';
import 'package:animal_vax/login/utilities/password_field.dart';
import 'package:animal_vax/login/utilities/submit_button.dart';
import 'package:animal_vax/login/utilities/username_field.dart';
import 'package:flutter/material.dart';

class LoginDoc extends StatelessWidget {
  const LoginDoc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Doctor Login"
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LoginHeader(),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            const UsernameField(),
            const PasswordField(),
            const SubmitButton(),
          ],
        ),
      )
    );
  }
}
