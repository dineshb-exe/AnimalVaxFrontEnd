import 'package:animal_vax/login/post_login_model.dart';
import 'package:animal_vax/new_pet/bloc/new_pet_bloc.dart';
import 'package:animal_vax/new_pet/pet_model.dart';
import 'package:animal_vax/login/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../global_utilities/general_field.dart';
import 'package:intl/intl.dart';

class NewPetWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final PostLogin authToken;
  final User user;
  final NewPetBloc newPetBloc;
  final TextEditingController petNameCont;
  final TextEditingController breedCont;
  final TextEditingController petDobCont;
  final TextEditingController petAgeCont;
  final TextEditingController microchipCont;
  final TextEditingController colorCont;
  final bool isLoading;
  NewPetWidget({Key? key, required this.user, required this.newPetBloc, required this.authToken, required this.petAgeCont, required this.petNameCont, required this.microchipCont, required this.colorCont, required this.breedCont, required this.petDobCont, required this.isLoading}) : super(key: key);

  @override
  State<NewPetWidget> createState() => _NewPetWidgetState();
}

class _NewPetWidgetState extends State<NewPetWidget> {
  String sexDropdownVal = "Male";
  List<String> sexesList = ["Male","Female"];
  String speciesDropdownVal = "Dog";
  List<String> speciesList = ["Dog", "Cat"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            GeneralField(
              placeholder:"Pet Name",
              tc: widget.petNameCont,
              validationType: 1,
            ),
            GeneralField(
              placeholder:"Breed",
              tc: widget.breedCont,
              validationType: 1,
            ),
            GeneralField(
              placeholder:"Date of Birth of Pet(DD/MM/YYYY)",
              tc: widget.petDobCont,
              validationType: 1,
            ),
            GeneralField(
              placeholder:"Age",
              tc: widget.petAgeCont,
              validationType: 1,
            ),
            GeneralField(
              placeholder:"Microchip No.",
              tc: widget.microchipCont,
              validationType: 0,
            ),
            GeneralField(
              placeholder:"Colour",
              tc: widget.colorCont,
              validationType: 1,
            ),
            DropdownButton(
                value: sexDropdownVal,
                items: sexesList.map<DropdownMenuItem<String>>((String val){
                  return DropdownMenuItem(
                    value: val,
                    child: Text(val),
                  );
                }).toList(),
                onChanged: (String? value){
                  sexDropdownVal=value!;
                  setState(() {});
                }
            ),
            DropdownButton(
                value: speciesDropdownVal,
                items: speciesList.map<DropdownMenuItem<String>>((String val){
                  return DropdownMenuItem(
                    value: val,
                    child: Text(val),
                  );
                }).toList(),
                onChanged: (String? value){
                  speciesDropdownVal=value!;
                  setState(() {});
                }
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            (widget.isLoading)?
             const CircularProgressIndicator()
            : FilledButton(
                onPressed: () {
                  if(!widget.isLoading){
                    if(widget.formKey.currentState!.validate()){
                      widget.newPetBloc.add(NewPetAddedEvent(
                        authToken: widget.authToken,
                        pet: Pet(
                          name: widget.petNameCont.text,
                          age: int.parse(widget.petAgeCont.text.isNotEmpty ? widget.petAgeCont.text : "-1"),
                          breed: widget.breedCont.text,
                          color: widget.colorCont.text,
                          sex: sexDropdownVal == "Male" ? "M" : "F",
                          dob: formattedDate(widget.petDobCont.text),
                          owner_id: widget.user.id,
                          microchip: int.parse(widget.microchipCont.text.isNotEmpty ? widget.microchipCont.text : "-1"),
                          species: speciesDropdownVal == "Dog" ? "C" : "F",
                        ),
                      )
                    );
                  }
                }
              },
              child: Text("Add", style: GoogleFonts.poppins(),),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
          ],
        )
      ),
    );
  }
  String formattedDate(String inputDate){
    DateFormat inputFormat = DateFormat('dd/MM/yyyy');
    DateFormat outputFormat = DateFormat('yyyy-MM-dd');
    DateTime date = inputFormat.parse(inputDate);
    return outputFormat.format(date);
  }
}
