import 'package:animal_vax/dashboard/bloc/dashboard_bloc.dart';
import 'package:animal_vax/dashboard/utilities/dashboard_widget.dart';
import 'package:animal_vax/global_utilities/app_navigation_bar.dart';
import 'package:animal_vax/global_utilities/snackbar.dart';
import 'package:animal_vax/login/post_login_model.dart';
import 'package:animal_vax/login/user_model.dart';
import 'package:animal_vax/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  final PostLogin authToken;
  final User userInfo;

  const Dashboard({Key? key, required this.authToken, required this.userInfo}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final DashboardBloc dashboardBloc = DashboardBloc();
  @override
  void initState() {
    // TODO: implement initState
    dashboardBloc.add(DashboardInitialEvent(authToken: widget.authToken, userInfo: widget.userInfo));
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      bloc: dashboardBloc,
      buildWhen: (previous, current) => current is !DashboardActionState,
      listenWhen: (previous, current) => current is DashboardActionState,
      listener: (context, state) {
        // TODO: implement listener
        if(state is DashboardNewPetAddedErrorActionState){
          customSnackbar(context, "Error! Cannot add a pet!");
        }
        else if(state is DashboardNewPetNavigateActionState){
          Navigator.popAndPushNamed(context, RouteManager.newPet, arguments: {'authToken': state.authToken, 'user': state.user});
        }
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case DashboardSuccessState:
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "TN Pet Vaccination Portal",
                  style: GoogleFonts.poppins(),
                ),
                centerTitle: true,
                actions: [
                  PopupMenuButton(
                      onSelected: (String value){
                        if(value=="logout") {
                          Navigator.popAndPushNamed(context, RouteManager.loginPage);
                        }
                        return;
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: "logout",
                          child: Text("Logout"),
                        ),
                      ]
                  ),
                ],
              ),
              body: DashboardWidget(dashboardBloc: dashboardBloc,),
              bottomNavigationBar: AppNavigationBar(currentPageIndex: 0, dashboardBloc: dashboardBloc, user: widget.userInfo, authToken: widget.authToken),
            );
          case DashboardLoadingState:
            return const Scaffold(
              body: CircularProgressIndicator(),
            );
          case DashboardErrorState:
            return Scaffold(
              body: Center(
                child: Text("Error Encountered", style: GoogleFonts.poppins(),),
              ),
            );
          default:
            return const Scaffold();
        }
      },
    );
  }
}