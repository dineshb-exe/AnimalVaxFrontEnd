import 'package:flutter/material.dart';

import '../routes.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Animal Vax App"
        ),
        centerTitle: true,
        elevation: 1.5,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteManager.loginDoctor);
              },
              child: const Text(
                "Login as a doctor"
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize:Size(MediaQuery.of(context).size.width*0.3, MediaQuery.of(context).size.height*0.05)
              ),
              child: const Text(
                "Login as a patient"
              ),
            ),
          ],
        ),
      ),
    );
  }
}
