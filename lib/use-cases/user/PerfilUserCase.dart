import 'package:tfg_ginyote/domain/user/Register.dart';

import '../../data/user/LoginRepository.dart';
import '../../domain/user/Login.dart';
import '../../domain/user/PerfilEnviar.dart';
import '../../domain/user/PerfilResponse.dart';
import '../../domain/user/User.dart';

class PerfilUserCase{
  LoginRepository _loginRepository;
  PerfilUserCase(this._loginRepository);
  Future<PerfilResponse?> postEditarPerfil(PerfilEnviar r) async{
    final response = await _loginRepository.postEditarResponse(r);
    return response;
  }
}