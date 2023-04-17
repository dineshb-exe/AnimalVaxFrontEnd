import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../routes.dart';
import 'utilities/login_widget.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "TN Pet Vaccination",
            style: GoogleFonts.poppins()
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Login as Pet Owner",
                icon: Icon(Icons.pets),
              ),
              Tab(
                text: "Login as Doctor",
                icon: Icon(Icons.local_hospital)
              )
            ]
          ),
        ),
        body: TabBarView(
          children: [
            LoginWidget(
              type: "Pet",
            ),
            LoginWidget(
              type: "Doc",
            ),
          ],
        )
      ),
    );
  }
}
