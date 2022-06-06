part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}
class LoginSuccessfulState extends LoginState {
  LoginResponse loginResponse;
  LoginSuccessfulState(this.loginResponse);
}
class LoginErrorState extends LoginState{
  LoginResponse loginResponse;
  LoginErrorState(this.loginResponse);
}

class VisibilityChanged extends LoginState {}