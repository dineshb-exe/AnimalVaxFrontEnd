import 'package:animal_vax/global_utilities/snackbar.dart';
import 'package:animal_vax/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../routes.dart';
import 'utilities/login_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginBloc loginBloc = LoginBloc();
  @override
  void initState() {
    // TODO: implement initState
    loginBloc.add(LoginInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: loginBloc,
      listener: (context, state) {
        // TODO: implement listener
        if(state is LoginCredentialsFailedActionState){
          customSnackbar(context, "Invalid Credentials");
        }
        else if(state is LoginNavigateToLocationActionState){
          Navigator.popAndPushNamed(
              context,
              RouteManager.location,
              arguments: {
                "authToken": state.authToken,
                "userInfo": state.userInfo,
              }
          );
        }
      },
      listenWhen: (previous, current) => current is LoginActionState,
      buildWhen: (previous, current) => current is !LoginActionState,
      builder: (context, state) {
        switch(state.runtimeType){
          case LoginInitialState:
            return DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                      "TN Pet Vaccination",
                      style: GoogleFonts.poppins()
                  ),
                  centerTitle: true,
                  bottom: const TabBar(
                      tabs: [
                        Tab(
                          text: "Login as Pet Owner",
                          icon: Icon(Icons.pets),
                        ),
                        Tab(
                            text: "Login as Doctor",
                            icon: Icon(Icons.local_hospital)
                        )
                      ]
                  ),
                ),
                body: TabBarView(
                  children: [
                    LoginWidget(
                      type: "Pet",
                      loginBloc: loginBloc,
                    ),
                    LoginWidget(
                      type: "Doc",
                      loginBloc: loginBloc,
                    ),
                  ],
                )
            ),
          );
          case LoginLoadingState:
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case LoginErrorState:
            return const Scaffold(
              body:  Center(
                child: Text(
                  "Error",
                ),
              ),
            );
          default:
            return const Scaffold();
        }
      },
    );
  }
}
