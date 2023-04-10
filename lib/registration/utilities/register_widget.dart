import 'package:animal_vax/routes.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            Icon(
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
            ),
            GeneralField(
              placeholder: "EMail",
              tc: unameCont,
            ),
            GeneralField(
              placeholder: "Password",
              tc: pwdCont,
            ),
            GeneralField(
              placeholder: "Confirm Password",
              tc: pwd2Cont,
            ),
            GeneralField(
              placeholder:"Address",
              tc: addrCont,
            ),
            GeneralField(
              placeholder:"Phone Number",
              tc: phnoCont,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            ElevatedButton(
              onPressed: (){
                setState((){
                  //HTTP POST call to backend
                  Navigator.popAndPushNamed(context, RouteManager.registerConfirmation);
                });
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width*0.3,MediaQuery.of(context).size.height*0.05),
              ),
              child: const Text(
                "Submit",
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
          ],
        ),
      ),
    );
  }
}
