import 'package:animal_vax/dashboard/bloc/dashboard_bloc.dart';
import 'package:animal_vax/dashboard/dashboard_pet_model.dart';
import 'package:animal_vax/login/post_login_model.dart';
import 'package:animal_vax/login/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PetTile extends StatefulWidget {
  final DashboardPet pet;
  final User user;
  final PostLogin authToken;
  final DashboardBloc dashboardBloc;
  final String latitude;
  final String longitude;
  const PetTile({super.key, required this.latitude, required this.longitude , required this.dashboardBloc, required this.pet, required this.user, required this.authToken});

  @override
  State<PetTile> createState() => _PetTileState();
}

class _PetTileState extends State<PetTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      elevation: 3.0,
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.pets_sharp),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Text("Pet Name: ${widget.pet.name}", style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
                    // Text("Species: ${widget.pet.species}", style: GoogleFonts.poppins(),),
                    Text("Breed: ${widget.pet.breed}", style: GoogleFonts.poppins(),),
                    // Text("Sex: ${widget.pet.sex}", style: GoogleFonts.poppins(),),
                    Text("Microchip Number: ${widget.pet.microchip}", style: GoogleFonts.poppins(),)
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {
                widget.dashboardBloc.add(DashboardBookAppointmentNavigateEvent(pet: widget.pet, authToken: widget.authToken, user: widget.user, longitude: widget.longitude, latitude: widget.latitude));
              }, child: Text("Book Appointment", style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),),
              TextButton(onPressed: () {}, child: Text("Edit Details", style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),)
            ],
          )
        ],
      ),
    );
  }
}
