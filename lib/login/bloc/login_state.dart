part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {}

abstract class LoginActionState extends LoginState {}

class LoginNavigateToLocationActionState extends LoginActionState {
  final PostLogin authToken;
  LoginNavigateToLocationActionState({required this.authToken});
}

class LoginCredentialsFailedActionState extends LoginActionState {}