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
              validationType: 1,
            ),
            GeneralField(
              placeholder:"Breed",
              tc: breedCont,
              validationType: 1,
            ),
            GeneralField(
              placeholder:"Date of Birth of Pet(DD/MM/YYYY)",
              tc: petAgeCont,
              validationType: 1,
            ),
            GeneralField(
              placeholder:"Microchip No.",
              tc: microchipCont,
              validationType: 0,
            ),
            GeneralField(
              placeholder:"Colour",
              tc: colorCont,
              validationType: 1,
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
                  print(dropdownVal);
                  print(value);
                  setState(() {});
                }
            ),
          ],
        )
      ),
    );
  }
}
