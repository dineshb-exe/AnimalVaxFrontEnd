part of 'location_bloc.dart';

@immutable
abstract class LocationEvent {}

class LocationInitialEvent  extends LocationEvent {}

class LocationButtonPressedEvent  extends LocationEvent {}

class LocationDashboardNavigateEvent extends LocationEvent {
  PostLogin authToken;
  LocationDashboardNavigateEvent({required this.authToken});
}