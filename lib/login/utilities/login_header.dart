import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  var type="Doc";
  LoginHeader({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return (type=="Doc")?Image.asset(
      "assets/Docs.jpeg",
      height: MediaQuery.of(context).size.height*0.3,
    ): Image.asset(
      "assets/Dog3.jpeg",
      height: MediaQuery.of(context).size.height*0.3
    );
  }
}
