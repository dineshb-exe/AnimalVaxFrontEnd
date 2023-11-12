import 'package:animal_vax/registration/models/reg_model.dart';
import 'package:animal_vax/registration/reg_services.dart';
import 'package:animal_vax/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../global_utilities/general_field.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({Key? key}) : super(key: key);


  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final TextEditingController unameCont = TextEditingController();
  final TextEditingController pwdCont = TextEditingController();
  final TextEditingController pwd2Cont = TextEditingController();
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController addrCont = TextEditingController();
  final TextEditingController phnoCont = TextEditingController();
  final GlobalKey<FormState> _regKey = GlobalKey<FormState>();
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _regKey,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            const Icon(
              Icons.pets_rounded,
              size: 120.0,
              color: Color(0xFF0578BD),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            GeneralField(
              placeholder: "Owner Name",
              tc: nameCont,
              validationType: 1,
            ),
            GeneralField(
              placeholder: "EMail",
              tc: unameCont,
              validationType: 1,
            ),
            GeneralField(
              placeholder: "Password",
              tc: pwdCont,
              validationType: 1
            ),
            GeneralField(
              placeholder: "Confirm Password",
              tc: pwd2Cont,
              validationType: 1
            ),
            GeneralField(
              placeholder:"Address",
              tc: addrCont,
              validationType: 1
            ),
            GeneralField(
              placeholder:"Phone Number",
              tc: phnoCont,
              validationType: 1
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            (!_loading)?ElevatedButton(
              onPressed: () async{
                if(_regKey.currentState!.validate() && pwdCont.text == pwd2Cont.text){
                  _loading = true;
                  setState(() {});
                  //HTTP POST call to backend
                  Owner o1 = Owner(
                      name: nameCont.text,
                      address: addrCont.text,
                      password: pwdCont.text,
                      phone: "+91 ${phnoCont.text}",
                      email: unameCont.text
                  );
                  OwnerServices oS1 = OwnerServices();
                  await oS1.register(o1);
                  _loading = false;
                  setState(() {});
                  Navigator.popAndPushNamed(context, RouteManager.registerConfirmation);
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width*0.3,MediaQuery.of(context).size.height*0.05),
              ),
              child: Text(
                "Submit",
                style: GoogleFonts.poppins()
              ),
            ):
            const CircularProgressIndicator(),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
          ],
        ),
      ),
    );
  }
}
