part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class DashboardInitialEvent extends DashboardEvent {
  final PostLogin authToken;
  final User userInfo;
  DashboardInitialEvent({required this.authToken, required this.userInfo});
}

class DashboardAddNewPetNavigateEvent extends DashboardEvent {
  final PostLogin authToken;
  final User user;
  DashboardAddNewPetNavigateEvent({required this.authToken, required this.user});
}

class DashboardBookAppointmentNavigateEvent extends DashboardEvent {
  final PostLogin authToken;
  final User user;
  final DashboardPet pet;
  final String latitude;
  final String longitude;
  DashboardBookAppointmentNavigateEvent({required this.latitude, required this.longitude, required this.pet, required this.authToken, required this.user});
}

class DashboardEditDetailsNavigateEvent extends DashboardEvent {}

class DashboardProfileNavigateEvent extends DashboardEvent {}

class DashboardLogoutEvent extends DashboardEvent {}