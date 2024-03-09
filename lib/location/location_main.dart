import 'package:animal_vax/location/utilities/location_widget.dart';
import 'package:animal_vax/login/post_login_model.dart';
import 'package:animal_vax/login/user_model.dart';
import 'package:animal_vax/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/location_bloc.dart';

class LocationMain extends StatefulWidget {
  final PostLogin authToken;
  final User userInfo;

  const LocationMain({Key? key, required this.authToken, required this.userInfo}) : super(key: key);

  @override
  State<LocationMain> createState() => _LocationMainState();
}

class _LocationMainState extends State<LocationMain> {
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
              'authToken': state.authToken,
              'userInfo': state.userInfo,
              'latitude': state.latitude,
              'longitude': state.longitude
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
              latitude: successState.latitude,
              longitude: successState.longitude,
              locationBloc: locationBloc,
              authToken: widget.authToken,
              userInfo: widget.userInfo,
            );
          case LocationLoadingState:
            return LocationWidget(
              loading: true,
              locFlag: false,
              coordinates: "",
              latitude: "",
              longitude: "",
              locationBloc: locationBloc,
              authToken: widget.authToken,
              userInfo: widget.userInfo,
            );
          default:
            return const Scaffold();
        }
      },
    );
  }
}
