import 'package:flutter/material.dart';
import '../../bloc/user/user_bloc.dart';
import '../../util/funciones/FuncionalidadRegistroPress.dart';

class BotonRegistro {
  Widget getBotonRegistro(
      Map<String, List<String>?> fieldErrors,
      UserBloc userBloc,
      TextEditingController usrController,
      TextEditingController passwordController,
      TextEditingController nombreController,
      TextEditingController apellidoController,
      TextEditingController telefonoController,
      ) {
    final funcionalidadRegistro = FuncionalidadRegistroPress();

    return Positioned(
      bottom: -30,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.green[700],
        child: IconButton(
          icon: Icon(Icons.check, color: Colors.white),
          onPressed: () {
            funcionalidadRegistro.onRegisterPressed(
              usrController,
              passwordController,
              nombreController,
              apellidoController,
              telefonoController,
              userBloc,
              fieldErrors,
            );
          },
        ),
      ),
    );
  }
}
