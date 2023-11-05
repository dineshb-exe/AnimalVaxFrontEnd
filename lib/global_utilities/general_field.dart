import 'package:flutter/material.dart';

class GeneralField extends StatelessWidget {
  final String placeholder;
  final TextEditingController tc;
  final int validationType;
  const GeneralField({Key? key, required this.placeholder, required this.tc, required this.validationType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.07, 0, MediaQuery.of(context).size.width*0.07, MediaQuery.of(context).size.width*0.10),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: placeholder,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(35.0))
          ),
          contentPadding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.04, 0, MediaQuery.of(context).size.width*0.07, MediaQuery.of(context).size.width*0.04),
        ),
        controller: tc,
        onEditingComplete: () => FocusScope.of(context).nextFocus(),
        validator: (validationType==1)?(String? val){
          if(val==null||val.isEmpty){
            return "Please Enter some Text";
          }
          return null;
        }
        :null,
        obscureText: (placeholder=="Password"||placeholder=="Confirm Password")?true: false,
        enableSuggestions: true,
        autocorrect: true,
        keyboardType: (placeholder=="EMail")?TextInputType.emailAddress: (placeholder=="Date of Birth of Pet(DD/MM/YYYY)")? TextInputType.datetime : (placeholder == "Age" || placeholder == "Phone Number" || placeholder == "Microchip No.") ? TextInputType.number : TextInputType.text,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
