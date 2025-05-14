part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}


class LoadingLoginState extends UserState {}

class LoginState extends UserState{
  LoginResponse loginResponse;

  LoginState(this.loginResponse);
}

class ErrorLoginState extends UserState{
  LoginResponse loginResponse;

  ErrorLoginState(this.loginResponse);
}

class ErrorState extends UserState{
  String error;

  ErrorState(this.error);
}

class RegistroState extends UserState{
  RegisterResponse registerResponse;

  RegistroState(this.registerResponse);
}

class LoadingRegisterState extends UserState{
  RegisterResponse registerResponse;

  LoadingRegisterState(this.registerResponse);
}

class ErrorRegistroState extends UserState{
  RegisterResponse registerResponse;

  ErrorRegistroState(this.registerResponse);
}