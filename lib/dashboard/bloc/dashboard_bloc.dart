import 'dart:async';

import 'package:animal_vax/dashboard/dashboard_pet_model.dart';
import 'package:animal_vax/dashboard/dashboard_services.dart';
import 'package:animal_vax/login/post_login_model.dart';
import 'package:animal_vax/login/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardInitialEvent>(dashboardInitialEvent);
    on<DashboardAddNewPetNavigateEvent>(dashboardAddNewPetNavigateEvent);
    on<DashboardBookAppointmentNavigateEvent>(dashboardBookAppointmentNavigateEvent);
    on<DashboardEditDetailsNavigateEvent>(dashboardEditDetailsNavigateEvent);
    on<DashboardProfileNavigateEvent>(dashboardProfileNavigateEvent);
    on<DashboardLogoutEvent>(dashboardLogoutEvent);

  }

  FutureOr<void> dashboardInitialEvent(DashboardInitialEvent event, Emitter<DashboardState> emit) async {
    PostLogin authToken = event.authToken;
    User user = event.userInfo;
    DashboardServices d1 = DashboardServices();
    emit(DashboardLoadingState());
    var responseValues = await d1.feedPets(user: user, authToken: authToken);
    if(responseValues["status"] == "Success"){
      emit(DashboardSuccessState(authToken: authToken, pets: responseValues["data"]));
    }
    else{
      print(responseValues["Message"]);
      emit(DashboardErrorState());
    }
  }

  FutureOr<void> dashboardAddNewPetNavigateEvent(DashboardAddNewPetNavigateEvent event, Emitter<DashboardState> emit) async {
    PostLogin authToken = event.authToken;
    User user = event.user;
    emit(DashboardNewPetNavigateActionState(authToken: authToken, user: user));
  }

  FutureOr<void> dashboardBookAppointmentNavigateEvent(DashboardBookAppointmentNavigateEvent event, Emitter<DashboardState> emit) {
    PostLogin authToken = event.authToken;
    User user = event.user;
    DashboardPet pet = event.pet;
    emit(DashboardBookAppointmentNavigateActionState(pet: pet, user: user, authToken: authToken));
  }

  FutureOr<void> dashboardEditDetailsNavigateEvent(DashboardEditDetailsNavigateEvent event, Emitter<DashboardState> emit) {

  }

  FutureOr<void> dashboardProfileNavigateEvent(DashboardProfileNavigateEvent event, Emitter<DashboardState> emit) {

  }

  FutureOr<void> dashboardLogoutEvent(DashboardLogoutEvent event, Emitter<DashboardState> emit) {

  }
}
