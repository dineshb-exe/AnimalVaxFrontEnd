import 'package:animal_vax/new_pet/utilities/new_pet_widget.dart';
import 'package:flutter/material.dart';
DialogForm(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        var formKey;
        return AlertDialog(
          content: NewPetWidget(),
          title: Text('New Pet'),
          actions: <Widget>[
            InkWell(
              child: const Text(
                'Cancel'
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            InkWell(
              child: const Text(
                  'Add'
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}