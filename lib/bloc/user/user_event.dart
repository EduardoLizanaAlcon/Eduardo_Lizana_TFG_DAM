part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class LoginEvent extends UserEvent{
  Login login;
  LoginEvent(this.login);
}
class RegisterEvent extends UserEvent{
  Register registro;
  RegisterEvent(this.registro);
}




