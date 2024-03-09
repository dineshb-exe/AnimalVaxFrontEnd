import 'dart:async';

import 'package:animal_vax/new_pet/new_pet_services.dart';
import 'package:animal_vax/new_pet/pet_model.dart';
import 'package:animal_vax/login/post_login_model.dart';
import 'package:animal_vax/login/user_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_pet_event.dart';
part 'new_pet_state.dart';

class NewPetBloc extends Bloc<NewPetEvent, NewPetState> {
  NewPetBloc() : super(NewPetInitial()) {
    on<NewPetInitialEvent>(newPetInitialEvent);
    on<NewPetAddedEvent>(newPetAddedEvent);
    on<NewPetDashboardNavigateEvent>(newPetDashboardNavigateEvent);
  }

  FutureOr<void> newPetInitialEvent(NewPetInitialEvent event, Emitter<NewPetState> emit) {
    emit(NewPetInitialState());
  }

  FutureOr<void> newPetAddedEvent(NewPetAddedEvent event, Emitter<NewPetState> emit) async{
    PostLogin authToken = event.authToken;
    Pet pet = event.pet;
    NewPetServices n1 = NewPetServices();
    emit(NewPetLoadingState());
    var responseValues = await n1.addPet(pet: pet, authToken: authToken);
    if(responseValues["status"] == "Success"){
      emit(NewPetInitialState());
      emit(NewPetAddedActionState());
    }
    else{
      emit(NewPetInitialState());
      emit(NewPetAddedErrorActionState());
    }

  }

  FutureOr<void> newPetDashboardNavigateEvent(NewPetDashboardNavigateEvent event, Emitter<NewPetState> emit) {
    PostLogin authToken = event.authToken;
    User user = event.user;
    emit(NewPetNavigateToDashboardActionState(user: user, authToken: authToken));
  }
}
