import 'package:animal_vax/dashboard/bloc/dashboard_bloc.dart';
import 'package:animal_vax/dashboard/dashboard_pet_model.dart';
import 'package:animal_vax/dashboard/utilities/pet_tile.dart';
import 'package:animal_vax/login/post_login_model.dart';
import 'package:animal_vax/login/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardWidget extends StatefulWidget {
  final DashboardBloc dashboardBloc;
  final List<dynamic> pets;
  final PostLogin authToken;
  final User userInfo;
  const DashboardWidget({Key? key, required this.dashboardBloc, required this.pets, required this.authToken, required this.userInfo}) : super(key: key);

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return (widget.pets.isNotEmpty)?RefreshIndicator(
      onRefresh: () async{
        widget.dashboardBloc.add(DashboardInitialEvent(authToken: widget.authToken, userInfo: widget.userInfo));
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: widget.pets.length,
        itemBuilder: (BuildContext context,int index) {
          return PetTile(pet: DashboardPet.fromJson(widget.pets[index]),);
        }
      ),
    ):
    Center(
      child: Text(
        "No pets were added",
        style: GoogleFonts.poppins(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w500,
          fontSize: 20.0,
        ),
      ),
    );
  }
}