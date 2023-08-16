import 'package:animal_vax/global_utilities/snackbar.dart';
import 'package:animal_vax/login/login_model.dart';
import 'package:animal_vax/login/utilities/login_header.dart';
import 'package:animal_vax/global_utilities/general_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animal_vax/login/utilities/login_services.dart';

import '../../routes.dart';

class LoginWidget extends StatefulWidget {
  String type="Doc";
  LoginWidget({Key? key, required this.type}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController unameCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  bool _loading = false;
  Future<void> onSubmit() async {
    if(_formKey.currentState!.validate()){
      String uname = unameCont.text;
      String pwd = passCont.text;
      LoginServices ls1 = LoginServices();
      Login l1 = Login(
        email: uname,
        password: pwd
      );
      _loading = true;
      setState(() {});
      if(await ls1.credentialCheck(l1)){
        Navigator.popAndPushNamed(
            context,
            RouteManager.location,
            arguments: {
              "uname": "${uname}",
            }
        );
      }
      else{
        _loading = false;
        setState(() {});
        snackbar(context, "Invalid Credentials");
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              LoginHeader(
                type: "${widget.type}",
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.05,
              ),
              GeneralField(
                placeholder: "EMail",
                tc: unameCont,
                validationType: 1,
              ),
              GeneralField(
                placeholder: "Password",
                tc: passCont,
                validationType: 1,
              ),
              ElevatedButton(
                onPressed: onSubmit,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width*0.3,MediaQuery.of(context).size.height*0.05),
                ),
                child: (!_loading)?Text(
                  "Submit",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500
                  ),
                ):
                CircularProgressIndicator(
                  strokeWidth: 1.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "Don't have an account?",
                      style: GoogleFonts.poppins()
                  ),
                  TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, RouteManager.register);
                      },
                      child: Text(
                        "Register",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500
                        ),
                      )
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
