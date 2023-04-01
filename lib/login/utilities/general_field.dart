import 'package:flutter/material.dart';

class GeneralField extends StatelessWidget {
  final String placeholder;
  const GeneralField({Key? key, required this.placeholder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.07, 0, MediaQuery.of(context).size.width*0.07, MediaQuery.of(context).size.width*0.10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: '${placeholder}',
          border: const OutlineInputBorder(),
        ),
        obscureText: (placeholder=="Password")?true: false,
        enableSuggestions: true,
        autocorrect: true,
        keyboardType: (placeholder=="Username")?TextInputType.emailAddress: TextInputType.text,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
