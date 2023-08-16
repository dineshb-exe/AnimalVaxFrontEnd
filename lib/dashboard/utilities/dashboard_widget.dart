import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  final List<String> entries = <String>['A'];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return (entries.isNotEmpty)?ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context,int index) {
        return Container(
          height: 120,
          margin: EdgeInsets.fromLTRB(5, 0, 5, 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.lightBlue[2],
            boxShadow: [
              BoxShadow(
                color: Colors.blue[50]!,
                spreadRadius: 2,
              ),
            ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.pets_rounded),
                title: Text('Pet Name: ${entries[index]}'),
                subtitle: Text('Species: Dog, Breed: X, Gender, Microchip No.'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    child: const Text('Book Appointment'),
                    onPressed: () {/* ... */},
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    child: const Text('Edit Details'),
                    onPressed: () {/* ... */},
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ],
          ),
        );
      }
    ):
    Center(
      child: Text(
        "No pets were added",
        style: GoogleFonts.poppins(
          color: Colors.blue[800],
          fontWeight: FontWeight.w500,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
