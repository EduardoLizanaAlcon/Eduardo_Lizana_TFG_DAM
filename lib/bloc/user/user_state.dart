part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

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