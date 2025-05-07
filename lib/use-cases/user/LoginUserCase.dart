import '../../data/user/LoginRepository.dart';
import '../../domain/user/Login.dart';
import '../../domain/user/User.dart';

class LoginUseCase{
  LoginRepository _loginRepository;
  LoginUseCase(this._loginRepository);
  Future<LoginResponse?> postLogin(Login l) async{
    final response = await _loginRepository.postLoginResponse(l);
    return response;
  }
}