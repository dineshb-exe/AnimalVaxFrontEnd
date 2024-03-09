part of 'book_appointment_bloc.dart';

@immutable
abstract class BookAppointmentState {}

class BookAppointmentInitial extends BookAppointmentState {}

class BookAppointmentInitialLoadingState extends BookAppointmentState {}

class BookAppointmentLoadingState extends BookAppointmentState {
  final List<dynamic> hospitals;
  final List<dynamic> vaccines;
  BookAppointmentLoadingState({required this.hospitals, required this.vaccines});
}

class BookAppointmentSuccessState extends BookAppointmentState {
  final List<dynamic> hospitals;
  final List<dynamic> vaccines;
  BookAppointmentSuccessState({required this.hospitals, required this.vaccines});
}

class BookAppointmentErrorState extends BookAppointmentState {}

abstract class BookAppointmentActionState extends BookAppointmentState {}

class AppointmentBookedSuccessActionState extends BookAppointmentActionState {}

class AppointmentBookedErrorActionState extends BookAppointmentActionState {}

class BookAppointmentNavigateToDashboardActionState extends BookAppointmentActionState {}