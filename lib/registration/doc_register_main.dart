import 'package:animal_vax/registration/utilities/doc_register_widget.dart';
import 'package:flutter/material.dart';

class DocRegister extends StatelessWidget {
  const DocRegister({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
              "Doctor Registration"
          ),
          centerTitle: true,
        ),
        body: const DocRegisterWidget()
    );
  }
}
