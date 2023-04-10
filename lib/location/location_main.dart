import 'package:animal_vax/location/utilities/location_image.dart';
import 'package:flutter/material.dart';

class LocationChoice extends StatelessWidget {
  final String uname;
  const LocationChoice({Key? key, required this.uname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "What's your location?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height*0.05,
          ),
          Text(
            "We will use it to provide nearby details of hospitals",
            style: TextStyle(
              fontSize: 16.0
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.05,
          ),
          LocationImage(),

        ],
      ),
    );
  }
}
