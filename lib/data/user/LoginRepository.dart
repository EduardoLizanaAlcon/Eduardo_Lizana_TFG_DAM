
import '../../domain/user/Login.dart';
import '../../domain/user/User.dart';

class LoginRepository {
  final _loginService;
  LoginRepository(this._loginService);
  Future<LoginResponse?> postLoginResponse(Login login) async =>  await _loginService.postLogin(login);
}