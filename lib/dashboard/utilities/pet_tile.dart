import 'package:animal_vax/dashboard/dashboard_pet_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PetTile extends StatefulWidget {
  final DashboardPet pet;
  const PetTile({super.key, required this.pet});

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
              TextButton(onPressed: () {}, child: Text("Book Appointment", style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),),
              TextButton(onPressed: () {}, child: Text("Edit Details", style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),)
            ],
          )
        ],
      ),
    );
  }
}
