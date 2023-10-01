import 'package:animal_vax/global_utilities/general_field.dart';
import 'package:animal_vax/location/bloc/location_bloc.dart';
import 'package:animal_vax/location/utilities/location_image.dart';
import 'package:animal_vax/login/post_login_model.dart';
import 'package:animal_vax/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';

class LocationWidget extends StatefulWidget {
  final bool loading;
  final bool locFlag;
  final String coordinates;
  final LocationBloc locationBloc;
  final PostLogin authToken;
  const LocationWidget({required this.authToken, required this.locationBloc, required this.loading, required this.locFlag, required this.coordinates, super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "What's your location?",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0,0.0),
              child: Text(
                "We will use it to provide nearby details of hospitals",
                style: GoogleFonts.poppins(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            const LocationImage(),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            (widget.locFlag)?Text(
              widget.coordinates,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold
              ),
            )
            : const SizedBox.shrink(),
            (widget.loading)? const
            CircularProgressIndicator()
                : (widget.locFlag)?const SizedBox.shrink():const Text(
                "Or"
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            ElevatedButton.icon(
                onPressed: () async{
                  widget.locationBloc.add(LocationButtonPressedEvent());
                },
                icon: const Icon(
                    Icons.location_on
                ),
                label: const Text(
                    "Current Location"
                )
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (widget.locFlag)?(){
          //Send Location to the backend
          widget.locationBloc.add(LocationDashboardNavigateEvent(authToken: widget.authToken));
        }:null,
        child: const Icon(
            Icons.arrow_forward
        ),
      ),
    );
  }
}
