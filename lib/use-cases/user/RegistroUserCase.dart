import 'package:tfg_ginyote/domain/user/Register.dart';

import '../../data/user/LoginRepository.dart';
import '../../domain/user/Login.dart';
import '../../domain/user/User.dart';

class Registrousercase{
  LoginRepository _loginRepository;
  Registrousercase(this._loginRepository);
  Future<LoginResponse?> postRegistro(Register r) async{
    final response = await _loginRepository.postRegistroResponse(r);
    return response;
  }
}