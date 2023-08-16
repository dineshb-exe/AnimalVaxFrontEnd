import 'package:animal_vax/global_utilities/general_field.dart';
import 'package:animal_vax/location/utilities/location_image.dart';
import 'package:animal_vax/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';

class LocationChoice extends StatefulWidget {
  final String uname;

  LocationChoice({Key? key, required this.uname}) : super(key: key);

  @override
  State<LocationChoice> createState() => _LocationChoiceState();
}

class _LocationChoiceState extends State<LocationChoice> {
  final TextEditingController locCon = TextEditingController();
  bool _loading=false;
  late bool locFlag = false;
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
            LocationImage(),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            Form(
              child: GeneralField(
                placeholder: "Address",
                tc: locCon,
                validationType: 0,
              )
            ),
            (_loading)?
            CircularProgressIndicator()
              :Text(
                "Or"
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            ElevatedButton.icon(
              onPressed: () async{
                _loading = !_loading;
                setState(() {});
                Location location = new Location();

                bool _serviceEnabled;
                PermissionStatus _permissionGranted;
                LocationData _locationData;

                _serviceEnabled = await location.serviceEnabled();
                if (!_serviceEnabled) {
                  _serviceEnabled = await location.requestService();
                  if (!_serviceEnabled) {
                    return;
                  }
                }

                _permissionGranted = await location.hasPermission();
                if (_permissionGranted == PermissionStatus.denied) {
                  _permissionGranted = await location.requestPermission();
                  if (_permissionGranted != PermissionStatus.granted) {
                    return;
                  }
                }

                _locationData = await location.getLocation();
                locCon.text = "${_locationData.latitude},${_locationData.longitude}";
                locFlag=true;
                _loading = !_loading;
                setState(() {});
              },
              icon: Icon(
                Icons.location_on
              ),
              label: Text(
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
        onPressed: ((locCon.text!=null&&locCon.text!="")||(locFlag))?(){
          //Send Location to the backend
          Navigator.popAndPushNamed(context, RouteManager.dashboard);
        }:null,
        child: Icon(
          Icons.arrow_forward
        ),
      ),
    );
  }
}
