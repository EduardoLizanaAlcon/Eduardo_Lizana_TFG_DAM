import "package:tfg_ginyote/domain/user/Register.dart";
import "package:tfg_ginyote/util/UsuarioDatos.dart";

import "../../domain/user/Login.dart";
import "../../domain/user/User.dart";
import "../../util/Entorno.dart";
import "../api-client-interfaz.dart";

class LoginService {
  final ApiClient apiClient;
  LoginService(this.apiClient);
  Future<LoginResponse?> postLogin(Login login) async {
    try{
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',

      };
      final response = await apiClient.post('${Entorno().getEntorno()}UserControlador/login',  headers, loginToJson(login));
      final l = loginResponseFromJson(response);
      return l;

    }catch(e){
      LoginResponse lr = LoginResponse(success: false, mensaje: "Error en la autenticación. Intentalo más tarde", usuario: null);
      return lr;
    }
  }

  Future<RegisterResponse?> postRegistro(Register registro) async {
    try{
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',

      };
      final response = await apiClient.post('${Entorno().getEntorno()}UserControlador/registrarUsuario',  headers, registerToJson(registro));
      final l = registerResponseFromJson(response);
      return l;

    }catch(e){
      RegisterResponse lr = RegisterResponse(success: false, mensaje: "Error en la autenticación. Intentalo más tarde", usuario: null);
      return lr;
    }
  }
}