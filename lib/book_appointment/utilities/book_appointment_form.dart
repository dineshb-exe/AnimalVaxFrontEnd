import 'package:animal_vax/book_appointment/bloc/book_appointment_bloc.dart';
import 'package:animal_vax/book_appointment/hospital_model.dart';
import 'package:animal_vax/book_appointment/vaccine_model.dart';
import 'package:animal_vax/dashboard/dashboard_pet_model.dart';
import 'package:animal_vax/login/post_login_model.dart';
import 'package:animal_vax/login/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookAppointmentForm extends StatefulWidget {
  final BookAppointmentBloc bookAppointmentBloc;
  final bool isLoading;
  final PostLogin authToken;
  final List<dynamic> hospitals;
  final List<dynamic> vaccines;
  final DashboardPet pet;
  final User user;
  const BookAppointmentForm({required this.authToken, required this.bookAppointmentBloc, required this.isLoading, required this.hospitals, required this.vaccines, required this.pet, required this.user, super.key});

  @override
  State<BookAppointmentForm> createState() => _BookAppointmentFormState();
}

class _BookAppointmentFormState extends State<BookAppointmentForm> {
  TextEditingController dOfApptCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Hospital? selectedHospital;
    Vaccine? selectedVaccine;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text("Hospital", style: GoogleFonts.poppins(fontSize: 18 ,fontWeight: FontWeight.w600),),
              ),
              DropdownMenu(
                hintText: "Select a Hospital",
                width: MediaQuery.of(context).size.width * 0.85,
                dropdownMenuEntries: widget.hospitals.map((e) {
                  Hospital hospital = Hospital.fromJson(e);
                  return DropdownMenuEntry(value: hospital, label: hospital.hospital_name);
                }).toList(),
                onSelected: (h) {
                  selectedHospital = h;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text("Vaccine", style: GoogleFonts.poppins(fontSize: 18 ,fontWeight: FontWeight.w600),),
              ),
              DropdownMenu(
                hintText: "Select a Vaccine",
                width: MediaQuery.of(context).size.width * 0.85,
                dropdownMenuEntries: widget.vaccines.map((e) {
                  Vaccine vaccine = Vaccine.fromJson(e);
                  return DropdownMenuEntry(value: vaccine, label: "${vaccine.name} (${vaccine.week_no} Weeks)");
                }).toList(),
                onSelected: (v) {
                  selectedVaccine = v;
                },
              ),

              (widget.isLoading) ? const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: CircularProgressIndicator(),
                ),
              ) : const SizedBox.shrink(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if(selectedHospital != null && selectedVaccine != null) {
                        widget.bookAppointmentBloc.add(AppointmentBookingEvent(authToken: widget.authToken, dashboardPet: widget.pet, hospital: selectedHospital!, vaccine: selectedVaccine!, user: widget.user, hospitals: widget.hospitals, vaccines: widget.vaccines));
                      }
                    },
                    child: Text("Book Appointment", style: GoogleFonts.poppins(),)
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
