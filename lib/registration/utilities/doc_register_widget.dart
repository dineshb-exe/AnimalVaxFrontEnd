import 'package:animal_vax/global_utilities/general_field.dart';
import 'package:animal_vax/registration/models/doc_reg_model.dart';
import 'package:animal_vax/registration/reg_services.dart';
import 'package:animal_vax/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DocRegisterWidget extends StatefulWidget {
  const DocRegisterWidget({super.key});

  @override
  State<DocRegisterWidget> createState() => _DocRegisterWidgetState();
}

class _DocRegisterWidgetState extends State<DocRegisterWidget> {
  TextEditingController docNameCont = TextEditingController();
  TextEditingController docAddressCont = TextEditingController();
  TextEditingController docPhoneCont = TextEditingController();
  TextEditingController docEMailCont = TextEditingController();
  TextEditingController docPasswordCont = TextEditingController();
  TextEditingController docConfirmPasswordCont = TextEditingController();
  TextEditingController docHospitalAddressCont = TextEditingController();
  bool _loading = false;
  final GlobalKey<FormState> docRegKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: docRegKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            const Icon(
              Icons.local_hospital_outlined,
              size: 120.0,
              color: Color(0xFFFC033D),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            GeneralField(placeholder: "Doctor Name", tc: docNameCont, validationType: 1),
            GeneralField(placeholder: "Address", tc: docAddressCont, validationType: 1),
            GeneralField(placeholder: "Phone", tc: docPhoneCont, validationType: 1),
            GeneralField(placeholder: "EMail", tc: docEMailCont, validationType: 1),
            GeneralField(placeholder: "Password", tc: docPasswordCont, validationType: 1),
            GeneralField(placeholder: "Confirm Password", tc: docConfirmPasswordCont, validationType: 1),
            GeneralField(placeholder: "Hospital Address", tc: docHospitalAddressCont, validationType: 1),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.02,
            ),
            (!_loading)?ElevatedButton(
              onPressed: () async{
                if(docRegKey.currentState!.validate() && docPasswordCont.text == docConfirmPasswordCont.text){
                  _loading = true;
                  setState(() {});
                  //HTTP POST call to backend
                  Doctor d1 = Doctor(
                    name: docNameCont.text,
                    address: docAddressCont.text,
                    password: docPasswordCont.text,
                    phone: "+91 ${docPhoneCont.text}",
                    email: docEMailCont.text,
                    hospital_address: docHospitalAddressCont.text
                  );
                  DoctorServices dS1 = DoctorServices();
                  await dS1.register(d1);
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
