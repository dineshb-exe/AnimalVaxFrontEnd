part of 'location_bloc.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoadingState extends LocationState {}

class LocationLoadedSuccessState extends LocationState {
  final String coordinates;
  final bool locFlag;
  LocationLoadedSuccessState({required this.locFlag, required this.coordinates});

}

class LocationFetchingState extends LocationState {}

abstract class LocationActionState extends LocationState {}

class LocationNavigateToDashboardActionState extends LocationActionState {
  PostLogin authToken;
  LocationNavigateToDashboardActionState({required this.authToken});
}



