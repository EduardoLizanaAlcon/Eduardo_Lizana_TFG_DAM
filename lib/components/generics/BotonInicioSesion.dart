import 'package:flutter/material.dart';
import '../../bloc/user/user_bloc.dart';
import '../../util/funciones/FuncionalidadLoginPress.dart';

class Botoniniciosesion {
  Widget getBotoniniciosesion(
      Map<String, List<String>?> fieldErrors,
      UserBloc userBloc,
      TextEditingController usrController,
      TextEditingController passwordController,
      ) {
    // Instanciamos la clase Funcionalidadloginpress para poder usar el método
    final funcionalidadLogin = Funcionalidadloginpress();

    return Positioned(
      bottom: -30,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.black,
        child: IconButton(
          icon: Icon(Icons.arrow_forward, color: Colors.white),
          onPressed: () {
            funcionalidadLogin.onLoginPressed(
              usrController,
              userBloc,
              passwordController,
              fieldErrors,
            );
          },
        ),
      ),
    );
  }
}
