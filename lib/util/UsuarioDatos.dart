import '../domain/user/User.dart';

class UsuarioDatos{
  static late Usuario usuario;

  static setUsuario (Usuario u){
    usuario = u;
  }

  static Usuario getUsuario (){
    return usuario;
  }
}