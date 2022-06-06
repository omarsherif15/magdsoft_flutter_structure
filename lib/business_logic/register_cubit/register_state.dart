part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoadingState extends RegisterState {}
class RegisterSuccessfulState extends RegisterState {
  final RegisterResponse registerResponse;
  RegisterSuccessfulState(this.registerResponse);
}
class RegisterErrorState extends RegisterState{
  final RegisterResponse registerResponse;
  RegisterErrorState(this.registerResponse);
}

class VisibilityChanged extends RegisterState {}