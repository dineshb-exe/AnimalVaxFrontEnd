import 'package:animal_vax/new_pet/utilities/new_pet_widget.dart';
import 'package:flutter/material.dart';

class NewPetPage extends StatelessWidget {
  const NewPetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Pet Registration"
        ),
        centerTitle: true,
      ),
      body: NewPetWidget(),
    );
  }
}
