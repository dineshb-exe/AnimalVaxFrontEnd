import 'package:flutter/material.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  Widget build(BuildContext context) {
    return ListView.builder(
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
                subtitle: Text('Species: Dog, Breed: X'),
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
    );
  }
}
