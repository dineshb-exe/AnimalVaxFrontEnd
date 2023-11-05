part of 'location_bloc.dart';

@immutable
abstract class LocationEvent {}

class LocationInitialEvent  extends LocationEvent {}

class LocationButtonPressedEvent  extends LocationEvent {}

class LocationDashboardNavigateEvent extends LocationEvent {
  final PostLogin authToken;
  final User userInfo;
  LocationDashboardNavigateEvent({required this.authToken, required this.userInfo});
}