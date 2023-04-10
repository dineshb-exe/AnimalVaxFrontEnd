import 'package:flutter/material.dart';
import '../../global_utilities/general_field.dart';

class NewPetWidget extends StatefulWidget {
  const NewPetWidget({Key? key}) : super(key: key);

  @override
  State<NewPetWidget> createState() => _NewPetWidgetState();
}

class _NewPetWidgetState extends State<NewPetWidget> {
  final TextEditingController petNameCont = TextEditingController();
  final TextEditingController breedCont = TextEditingController();
  final TextEditingController petAgeCont = TextEditingController();
  final TextEditingController microchipCont = TextEditingController();
  final TextEditingController colorCont = TextEditingController();
  final TextEditingController sexCont = TextEditingController();
  String dropdownVal = "Male";
  List<String> list = ["Male","Female"];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          children: [
            GeneralField(
              placeholder:"Pet Name",
              tc: petNameCont,
            ),
            GeneralField(
              placeholder:"Breed",
              tc: breedCont,
            ),
            GeneralField(
              placeholder:"Date of Birth of Pet(DD/MM/YYYY)",
              tc: petAgeCont,
            ),
            GeneralField(
              placeholder:"Microchip No.",
              tc: microchipCont,
            ),
            GeneralField(
              placeholder:"Colour",
              tc: colorCont,
            ),
            DropdownButton(
                value: dropdownVal,
                items: list.map<DropdownMenuItem<String>>((String val){
                  return DropdownMenuItem(
                    value: val,
                    child: Text(val),
                  );
                }).toList(),
                onChanged: (String? value){
                  dropdownVal=value!;
                }
            ),
          ],
        )
      ),
    );
  }
}
