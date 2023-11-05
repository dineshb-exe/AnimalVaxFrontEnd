part of 'new_pet_bloc.dart';

@immutable
abstract class NewPetState {}

class NewPetInitial extends NewPetState {}

class NewPetInitialState extends NewPetState {}

class NewPetLoadingState extends NewPetState {}

abstract class NewPetActionState extends NewPetState {}

class NewPetAddedActionState extends NewPetActionState {}

class NewPetAddedErrorActionState extends NewPetActionState {}

class NewPetNavigateToDashboardActionState extends NewPetActionState {
  final PostLogin authToken;
  final User user;
  NewPetNavigateToDashboardActionState({required this.user, required this.authToken});
}