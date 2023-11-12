import 'package:animal_vax/login/bloc/login_bloc.dart';
import 'package:animal_vax/login/login_model.dart';
import 'package:animal_vax/login/utilities/login_header.dart';
import 'package:animal_vax/global_utilities/general_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../routes.dart';

class LoginWidget extends StatefulWidget {
  final String type;
  final LoginBloc loginBloc;
  const LoginWidget({Key? key, required this.type, required this.loginBloc}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController unameCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              LoginHeader(
                type: widget.type,
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
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    widget.loginBloc.add(
                      LoginButtonPressedEvent(
                        credentials: PreLogin(
                          email: unameCont.text,
                          password: passCont.text,
                        ),
                        type: widget.type
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width*0.3,MediaQuery.of(context).size.height*0.05),
                ),
                child:Text(
                  "Submit",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500
                  ),
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
                        if(widget.type == "Doc"){
                          Navigator.pushNamed(context, RouteManager.docRegister);
                        }
                        else {
                          Navigator.pushNamed(context, RouteManager.register);
                        }
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
