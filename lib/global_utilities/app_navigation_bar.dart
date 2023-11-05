import 'package:animal_vax/dashboard/bloc/dashboard_bloc.dart';
import 'package:animal_vax/login/post_login_model.dart';
import 'package:animal_vax/login/user_model.dart';
import 'package:animal_vax/new_pet/bloc/new_pet_bloc.dart';
import 'package:flutter/material.dart';

class AppNavigationBar extends StatefulWidget {
  final int currentPageIndex;
  final DashboardBloc? dashboardBloc;
  final NewPetBloc? newPetBloc;
  final PostLogin authToken;
  final User user;
  const AppNavigationBar({super.key, required this.currentPageIndex, this.dashboardBloc, required this.user, required this.authToken, this.newPetBloc});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.dashboard),
          icon: Icon(Icons.dashboard_outlined),
          label: "Dashboard"
        ),
        NavigationDestination(
            selectedIcon: Icon(Icons.pets),
            icon: Icon(Icons.pets_outlined),
            label: "Add a new Pet"
        ),
      ],
      selectedIndex: widget.currentPageIndex,
      onDestinationSelected: (int index) {
        if(index == 0 && widget.currentPageIndex != 0){
          widget.newPetBloc!.add(NewPetDashboardNavigateEvent(authToken: widget.authToken, user: widget.user)); //Navigate from New Pet to Dashboard
        }
        else if(index == 1 && widget.currentPageIndex != 1){
          widget.dashboardBloc!.add(DashboardAddNewPetNavigateEvent(authToken: widget.authToken, user: widget.user));
        }
      },
    );
  }
}
