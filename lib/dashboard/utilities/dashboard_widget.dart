import 'package:animal_vax/dashboard/bloc/dashboard_bloc.dart';
import 'package:animal_vax/dashboard/utilities/pet_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardWidget extends StatefulWidget {
  final DashboardBloc dashboardBloc;
  const DashboardWidget({Key? key, required this.dashboardBloc}) : super(key: key);

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  final List<String> entries = <String>['A'];
  @override
  Widget build(BuildContext context) {
    return (entries.isNotEmpty)?ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context,int index) {
        return PetTile(petName: entries[index],);
      }
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