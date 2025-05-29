import 'package:tfg_ginyote/domain/user/Register.dart';

import '../../data/user/LoginRepository.dart';
import '../../domain/user/Login.dart';
import '../../domain/user/User.dart';

class RegistroUserCase{
  LoginRepository _loginRepository;
  RegistroUserCase(this._loginRepository);
  Future<RegisterResponse?> postRegistro(Register r) async{
    final response = await _loginRepository.postRegistroResponse(r);
    return response;
  }
}