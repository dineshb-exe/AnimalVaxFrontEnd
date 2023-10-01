import 'dart:async';

import 'package:animal_vax/login/post_login_model.dart';
import 'package:bloc/bloc.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<LocationInitialEvent>(locationInitialEvent);
    on<LocationButtonPressedEvent>(locationButtonPressedEvent);
    on<LocationDashboardNavigateEvent>(locationDashboardNavigateEvent);
  }

  FutureOr<void> locationInitialEvent(LocationInitialEvent event, Emitter<LocationState> emit) {
    emit(
      LocationLoadedSuccessState(
        coordinates: "",
        locFlag: false
      )
    );
  }

  FutureOr<void> locationButtonPressedEvent(LocationButtonPressedEvent event, Emitter<LocationState> emit) async{
    emit(LocationLoadingState());
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    emit(
      LocationLoadedSuccessState(
        coordinates: "${locationData.latitude}, ${locationData.longitude}",
        locFlag: true
      )
    );
  }

  FutureOr<void> locationDashboardNavigateEvent(LocationDashboardNavigateEvent event, Emitter<LocationState> emit) {
    PostLogin authToken = event.authToken;
    emit(LocationNavigateToDashboardActionState(authToken: authToken));
  }
}
