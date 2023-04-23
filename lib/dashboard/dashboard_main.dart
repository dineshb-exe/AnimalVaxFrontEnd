import 'package:animal_vax/dashboard/utilities/dashboard_widget.dart';
import 'package:animal_vax/dashboard/utilities/dialog_form.dart';
import 'package:animal_vax/global_utilities/general_field.dart';
import 'package:animal_vax/new_pet/utilities/new_pet_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TN Pet Vaccination Portal",
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
      ),
      body: DashboardWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => DialogForm(context),
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

DialogForm(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        var formKey;
          return AlertDialog(
            content: NewPetWidget(),
            title: Text('Stateful Dialog'),
            actions: <Widget>[
              InkWell(
                child: Text('OK'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
      });
}
