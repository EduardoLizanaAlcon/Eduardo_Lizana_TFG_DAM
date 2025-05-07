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
      LoginResponse lr = LoginResponse(success: false, mensaje: "Error en la autenticación. Intentalo más tarde", usuario: UsuarioDatos.usuario);
      return lr;
    }
  }
}