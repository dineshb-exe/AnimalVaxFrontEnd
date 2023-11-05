import 'package:animal_vax/dashboard/bloc/dashboard_bloc.dart';
import 'package:animal_vax/login/post_login_model.dart';
import 'package:animal_vax/login/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

DialogForm(BuildContext context, DashboardBloc dashboardBloc,
    PostLogin authToken, User userInfo, DashboardState state) async {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const SizedBox.shrink(),
          title: Text(
            'New Pet',
            style: GoogleFonts.poppins(),
          ),
          actions: <Widget>[
            InkWell(
              child: Text('Cancel', style: GoogleFonts.poppins(),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            InkWell(
              child: Text(
                'Add',
                style: GoogleFonts.poppins(),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}
