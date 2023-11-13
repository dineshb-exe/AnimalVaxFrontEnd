part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {

}

class DashboardInitialState extends DashboardState {
}

class DashboardLoadingState extends DashboardState {

}

class DashboardSuccessState extends DashboardState {
  final PostLogin authToken;
  final List<dynamic> pets;
  DashboardSuccessState({required this.authToken, required this.pets});
}

class DashboardErrorState extends DashboardState {

}

abstract class DashboardActionState extends DashboardState {}

class DashboardNavigateToProfileActionState extends DashboardActionState {

}

class DashboardAppointmentBookedActionState extends DashboardActionState {

}

class DashboardDetailsEditedActionState extends DashboardActionState {

}

class DashboardNewPetNavigateActionState extends DashboardActionState {
  final PostLogin authToken;
  final User user;
  DashboardNewPetNavigateActionState({required this.user, required this.authToken});
}

class DashboardNewPetAddedErrorActionState extends DashboardActionState {

}

class DashboardLogoutActionState extends DashboardActionState {

}