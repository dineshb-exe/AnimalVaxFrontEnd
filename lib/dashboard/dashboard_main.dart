import 'package:animal_vax/dashboard/utilities/dashboard_widget.dart';
import 'package:animal_vax/dashboard/utilities/dialog_form.dart';
import 'package:animal_vax/routes.dart';
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
        actions: [
          PopupMenuButton(
            onSelected: (String value){
              if(value=="logout")
              Navigator.popAndPushNamed(context, RouteManager.loginPage);
              return null;
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Logout"),
                value: "logout",
              ),
            ]
          ),
        ],
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
