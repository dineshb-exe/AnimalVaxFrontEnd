import 'dart:async';

import 'package:animal_vax/book_appointment/book_appointment_services.dart';
import 'package:animal_vax/book_appointment/hospital_model.dart';
import 'package:animal_vax/book_appointment/vaccine_model.dart';
import 'package:animal_vax/dashboard/dashboard_pet_model.dart';
import 'package:animal_vax/login/post_login_model.dart';
import 'package:animal_vax/login/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'book_appointment_event.dart';
part 'book_appointment_state.dart';

class BookAppointmentBloc extends Bloc<BookAppointmentEvent, BookAppointmentState> {
  BookAppointmentBloc() : super(BookAppointmentInitial()) {
    on<BookAppointmentInitialEvent>(bookAppointmentInitialEvent);
    on<AppointmentBookingEvent>(appointmentBookingEvent);
    on<BookAppointmentNavigateToDashboardEvent>(bookAppointmentNavigateToDashboardEvent);
  }

  FutureOr<void> bookAppointmentInitialEvent(BookAppointmentInitialEvent event, Emitter<BookAppointmentState> emit) async{
    String latitude = event.latitude;
    String longitude = event.longitude;
    PostLogin authToken = event.authToken;
    BookAppointmentServices bookAppointmentServices = BookAppointmentServices();
    emit(BookAppointmentInitialLoadingState());
    var getDoctorsResponse = await bookAppointmentServices.getDoctors(latitude: latitude, longitude: longitude, authToken: authToken);
    var getVaccinesResponse = await bookAppointmentServices.getVaccines(authToken: authToken);
    if(getDoctorsResponse["status"] == "Success" && getVaccinesResponse["status"] == "Success") {
      emit(BookAppointmentSuccessState(hospitals: getDoctorsResponse["data"], vaccines: getVaccinesResponse["data"]));
    }
    else {
      emit(BookAppointmentErrorState());
    }
  }

  FutureOr<void> appointmentBookingEvent(AppointmentBookingEvent event, Emitter<BookAppointmentState> emit) async{
    emit(BookAppointmentLoadingState(hospitals: event.hospitals, vaccines: event.vaccines));
    BookAppointmentServices bookAppointmentServices = BookAppointmentServices();
    var addAppointmentResponse = await bookAppointmentServices.addAppointment(authToken: event.authToken, user: event.user, pet: event.dashboardPet, hospital: event.hospital, vaccine: event.vaccine);
    if(addAppointmentResponse["status"] == "Success") {
      emit(BookAppointmentSuccessState(hospitals: event.hospitals, vaccines: event.vaccines));
      emit(AppointmentBookedSuccessActionState());
    }
    else {
      emit(AppointmentBookedErrorActionState());
    }
  }

  FutureOr<void> bookAppointmentNavigateToDashboardEvent(BookAppointmentNavigateToDashboardEvent event, Emitter<BookAppointmentState> emit) async{
    emit(BookAppointmentNavigateToDashboardActionState());
  }
}
