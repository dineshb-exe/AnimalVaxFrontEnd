import 'package:animal_vax/global_utilities/general_field.dart';
import 'package:animal_vax/location/utilities/location_image.dart';
import 'package:animal_vax/location/utilities/location_widget.dart';
import 'package:animal_vax/login/post_login_model.dart';
import 'package:animal_vax/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';

import 'bloc/location_bloc.dart';

class LocationChoice extends StatefulWidget {
  final PostLogin authToken;

  const LocationChoice({Key? key, required this.authToken}) : super(key: key);

  @override
  State<LocationChoice> createState() => _LocationChoiceState();
}

class _LocationChoiceState extends State<LocationChoice> {
  final LocationBloc locationBloc = LocationBloc();
  @override
  void initState() {
    // TODO: implement initState
    locationBloc.add(LocationInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationBloc, LocationState>(
      bloc: locationBloc,
      listenWhen: (prev,current) => current is LocationActionState,
      buildWhen: (prev,current) => current is !LocationActionState,
      listener: (context, state) {
        // TODO: implement listener
        if(state is LocationNavigateToDashboardActionState){
          Navigator.popAndPushNamed(
            context,
            RouteManager.dashboard,
            arguments: {
              'authToken': state.authToken
            }
          );
        }
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case LocationLoadedSuccessState:
            var successState = state as LocationLoadedSuccessState;
            return LocationWidget(
              loading: false,
              locFlag: successState.locFlag,
              coordinates: successState.coordinates,
              locationBloc: locationBloc,
              authToken: widget.authToken,
            );
          case LocationLoadingState:
            return LocationWidget(
              loading: true,
              locFlag: false,
              coordinates: "",
              locationBloc: locationBloc,
              authToken: widget.authToken,
            );
          default:
            return const Scaffold();
        }
      },
    );
  }
}
