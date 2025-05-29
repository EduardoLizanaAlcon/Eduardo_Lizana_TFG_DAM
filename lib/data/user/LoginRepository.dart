
import 'package:tfg_ginyote/domain/user/PerfilEnviar.dart';
import 'package:tfg_ginyote/domain/user/PerfilResponse.dart';
import 'package:tfg_ginyote/domain/user/Register.dart';

import '../../domain/user/Login.dart';
import '../../domain/user/User.dart';

class LoginRepository {
  final _loginService;
  LoginRepository(this._loginService);
  Future<LoginResponse?> postLoginResponse(Login login) async =>  await _loginService.postLogin(login);
  Future<RegisterResponse?> postRegistroResponse(Register registro) async =>  await _loginService.postRegistro(registro);
  Future<PerfilResponse?> postEditarResponse(PerfilEnviar perfilEnviar) async =>  await _loginService.postEditarPerfil(perfilEnviar);
}