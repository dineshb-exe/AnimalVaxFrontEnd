part of 'location_bloc.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoadingState extends LocationState {}

class LocationLoadedSuccessState extends LocationState {
  final String coordinates;
  final String latitude;
  final String longitude;
  final bool locFlag;
  LocationLoadedSuccessState({required this.latitude, required this.longitude ,required this.locFlag, required this.coordinates});

}

class LocationFetchingState extends LocationState {}

abstract class LocationActionState extends LocationState {}

class LocationNavigateToDashboardActionState extends LocationActionState {
  final PostLogin authToken;
  final User userInfo;
  final String latitude;
  final String longitude;
  LocationNavigateToDashboardActionState({required this.latitude, required this.longitude, required this.authToken, required this.userInfo});
}



