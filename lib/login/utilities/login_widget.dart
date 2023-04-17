import 'package:animal_vax/global_utilities/snackbar.dart';
import 'package:animal_vax/login/utilities/login_header.dart';
import 'package:animal_vax/global_utilities/general_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../routes.dart';

class LoginWidget extends StatefulWidget {
  String type="Doc";
  LoginWidget({Key? key, required this.type}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final formkey = GlobalKey<FormState>();
  TextEditingController unameCont = TextEditingController();
  TextEditingController passCont = TextEditingController();

  bool credentialCheck(String username, String password){
    return (username == "test" && password == "test")? true:false;
  }

  void onSubmit(){
    String uname = unameCont.text;
    String pwd = passCont.text;
    if(credentialCheck(uname, pwd)){
      Navigator.popAndPushNamed(
        context,
        RouteManager.location,
        arguments: {
          "uname": "${uname}",
        }
      );
    }
    else{
      snackbar(context, "Invalid Credentials");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
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
              ),
              GeneralField(
                placeholder: "Password",
                tc: passCont,
              ),
              ElevatedButton(
                onPressed: onSubmit,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width*0.3,MediaQuery.of(context).size.height*0.05),
                ),
                child: Text(
                  "Submit",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500
                  )
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
