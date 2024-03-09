import 'package:animal_vax/book_appointment/bloc/book_appointment_bloc.dart';
import 'package:animal_vax/book_appointment/utilities/book_appointment_form.dart';
import 'package:animal_vax/dashboard/dashboard_pet_model.dart';
import 'package:animal_vax/global_utilities/snackbar.dart';
import 'package:animal_vax/login/post_login_model.dart';
import 'package:animal_vax/login/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BookAppointment extends StatefulWidget {
  final PostLogin authToken;
  final User user;
  final DashboardPet pet;
  final String latitude;
  final String longitude;
  const BookAppointment({required this.latitude, required this.longitude, required this.pet, required this.authToken, required this.user, super.key});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  BookAppointmentBloc bookAppointmentBloc = BookAppointmentBloc();
  @override
  void initState() {
    // TODO: implement initState
    bookAppointmentBloc.add(BookAppointmentInitialEvent(user: widget.user, dashboardPet: widget.pet, latitude: widget.latitude, longitude: widget.longitude, authToken: widget.authToken));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookAppointmentBloc, BookAppointmentState>(
      bloc: bookAppointmentBloc,
      listener: (context, state) {
        // TODO: implement listener
        if(state is AppointmentBookedSuccessActionState){
          customSnackbar(context, "Appointment Booked");
        }
        else if(state is AppointmentBookedErrorActionState) {
          customSnackbar(context, "Error Occurred");
        }
        else if(state is BookAppointmentNavigateToDashboardActionState) {
          Navigator.pop(context);
        }
      },
      listenWhen: (previous,current) => current is BookAppointmentActionState,
      buildWhen: (previous,current) => current is !BookAppointmentActionState,
      builder: (context, state) {
        switch(state.runtimeType){
          case BookAppointmentSuccessState:
            final successState = state as BookAppointmentSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: Text("Book an appointment", style: GoogleFonts.poppins(),),
              ),
              body: BookAppointmentForm(authToken: widget.authToken, bookAppointmentBloc: bookAppointmentBloc, isLoading: false, hospitals: successState.hospitals, vaccines: state.vaccines, pet: widget.pet, user: widget.user,),
            );
          case BookAppointmentInitialLoadingState:
            return Scaffold(
              appBar: AppBar(
                title: Text("Book an appointment", style: GoogleFonts.poppins(),),
              ),
              body: const Center(child: CircularProgressIndicator()),
            );
          case BookAppointmentLoadingState:
            return Scaffold(
              appBar: AppBar(
                title: Text("Book an appointment", style: GoogleFonts.poppins(),),
              ),
              body: BookAppointmentForm(authToken: widget.authToken, bookAppointmentBloc: bookAppointmentBloc, isLoading: true, hospitals: state.hospitals, vaccines: state.vaccines, pet: widget.pet, user: widget.user,),
            );
          case BookAppointmentErrorState:
            return Scaffold(
              appBar: AppBar(
                title: Text("Book an appointment", style: GoogleFonts.poppins(),),
              ),
              body: Center(
                child: Text(
                  "Encountered an error, try loading again",
                  style: GoogleFonts.poppins(),
                ),
              ),
            );
          default:
            return const Scaffold();
        }
      },
    );
  }
}
