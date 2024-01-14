import 'package:flutter/material.dart';

class RegConfirmation extends StatelessWidget {
  const RegConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Registration Successful"
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.check_circle_rounded,
              color: Colors.green,
              size: 120.0,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text(
                "Back to Login"
              )
            ),
          ],
        )
      )
    );
  }
}
