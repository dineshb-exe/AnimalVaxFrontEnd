import 'dart:async';

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
    on<DashboardBookAppointmentEvent>(dashboardBookAppointmentEvent);
    on<DashboardEditDetailsEvent>(dashboardEditDetailsEvent);
    on<DashboardProfileNavigateEvent>(dashboardProfileNavigateEvent);
    on<DashboardLogoutEvent>(dashboardLogoutEvent);

  }

  FutureOr<void> dashboardInitialEvent(DashboardInitialEvent event, Emitter<DashboardState> emit) async {
    PostLogin authToken = event.authToken;
    User user = event.userInfo;
    DashboardServices d1 = DashboardServices();
    emit(DashboardLoadingState());
    var responseValues = await d1.feedPets(user);
    if(responseValues["status"] == "Success"){
      emit(DashboardSuccessState(authToken: authToken, pets: responseValues["data"]));
    }
    else{
      emit(DashboardErrorState());
    }
  }

  FutureOr<void> dashboardAddNewPetNavigateEvent(DashboardAddNewPetNavigateEvent event, Emitter<DashboardState> emit) async {
    PostLogin authToken = event.authToken;
    User user = event.user;
    emit(DashboardNewPetNavigateActionState(authToken: authToken, user: user));
  }

  FutureOr<void> dashboardBookAppointmentEvent(DashboardBookAppointmentEvent event, Emitter<DashboardState> emit) {

  }

  FutureOr<void> dashboardEditDetailsEvent(DashboardEditDetailsEvent event, Emitter<DashboardState> emit) {

  }

  FutureOr<void> dashboardProfileNavigateEvent(DashboardProfileNavigateEvent event, Emitter<DashboardState> emit) {

  }

  FutureOr<void> dashboardLogoutEvent(DashboardLogoutEvent event, Emitter<DashboardState> emit) {

  }
}
