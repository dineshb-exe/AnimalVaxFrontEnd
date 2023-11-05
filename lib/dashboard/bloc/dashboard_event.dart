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

class DashboardBookAppointmentEvent extends DashboardEvent {}

class DashboardEditDetailsEvent extends DashboardEvent {}

class DashboardProfileNavigateEvent extends DashboardEvent {}

class DashboardLogoutEvent extends DashboardEvent {}