part of 'new_pet_bloc.dart';

@immutable
abstract class NewPetEvent {}

class NewPetInitialEvent extends NewPetEvent {}

class NewPetAddedEvent extends NewPetEvent {
  final PostLogin authToken;
  final Pet pet;
  NewPetAddedEvent({required this.authToken, required this.pet});
}

class NewPetDashboardNavigateEvent extends NewPetEvent {
  final PostLogin authToken;
  final User user;
  NewPetDashboardNavigateEvent({required this.authToken, required this.user});
}