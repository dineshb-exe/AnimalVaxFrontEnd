import 'package:flutter/material.dart';

class GeneralField extends StatelessWidget {
  final String placeholder;
  final TextEditingController tc;
  const GeneralField({Key? key, required this.placeholder, required this.tc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.07, 0, MediaQuery.of(context).size.width*0.07, MediaQuery.of(context).size.width*0.10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: placeholder,
          border: const OutlineInputBorder(),
        ),
        controller: tc,
        obscureText: (placeholder=="Password"||placeholder=="Confirm Password")?true: false,
        enableSuggestions: true,
        autocorrect: true,
        keyboardType: (placeholder=="EMail")?TextInputType.emailAddress: (placeholder=="Date of Birth of Pet(DD/MM/YYYY)")? TextInputType.datetime : TextInputType.text,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
