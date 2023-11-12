import 'dart:async';

import 'package:animal_vax/login/login_model.dart';
import 'package:animal_vax/login/post_login_model.dart';
import 'package:animal_vax/login/user_model.dart';
import 'package:animal_vax/login/utilities/login_services.dart';
import 'package:bloc/bloc.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginInitialEvent>(loginInitialEvent);
    on<LoginButtonPressedEvent>(loginButtonPressedEvent);
    on<LoginInitialCheck>(loginInitialCheck);
  }

  FutureOr<void> loginInitialEvent(LoginInitialEvent event, Emitter<LoginState> emit) {
    emit(LoginInitialState());
  }

  FutureOr<void> loginInitialCheck(LoginInitialCheck event, Emitter<LoginState> emit) {

  }

  FutureOr<void> loginButtonPressedEvent(LoginButtonPressedEvent event, Emitter<LoginState> emit) async {
    String uname = event.credentials.email;
    String pwd = event.credentials.password;
    LoginServices ls1 = LoginServices();
    PreLogin l1 = PreLogin(
        email: uname,
        password: pwd
    );
    emit(LoginLoadingState());
    if (event.type == "Doc") {

    }
    else {
      var responseValues = await ls1.credentialCheck(l1);
      if (responseValues['status'] == "Success") {
        PostLogin authToken = PostLogin(jwtToken: responseValues['data']);
        Map<String, dynamic> payload = Jwt.parseJwt(authToken.jwtToken);
        print(payload);
        emit(LoginNavigateToLocationActionState(
            authToken: authToken, userInfo: User.fromJson(payload)));
      }
      else {
        emit(LoginInitialState());
        emit(LoginCredentialsFailedActionState());
      }
    }
  }
}
