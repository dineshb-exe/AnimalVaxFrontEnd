part of 'book_appointment_bloc.dart';

@immutable
abstract class BookAppointmentEvent {}

class BookAppointmentInitialEvent extends BookAppointmentEvent {
  final String latitude;
  final String longitude;
  final DashboardPet dashboardPet;
  final User user;
  final PostLogin authToken;
  BookAppointmentInitialEvent({required this.dashboardPet, required this.user, required this.latitude, required this.longitude, required this.authToken});
}

class AppointmentBookingEvent extends BookAppointmentEvent {
  final DashboardPet dashboardPet;
  final User user;
  final PostLogin authToken;
  final Hospital hospital;
  final Vaccine vaccine;
  final List<dynamic> hospitals;
  final List<dynamic> vaccines;
  AppointmentBookingEvent({required this.dashboardPet, required this.user, required this.authToken, required this.vaccine, required this.hospital, required this.hospitals, required this.vaccines});
}

class BookAppointmentNavigateToDashboardEvent extends BookAppointmentEvent {}