import 'package:flutter/cupertino.dart';
import '../../bloc/user/user_bloc.dart';
import '../../domain/user/Login.dart';
import '../../domain/user/Register.dart';

class FuncionalidadRegistroPress {
  Map<String, List<String>?> fieldErrors = {};

  void onRegisterPressed(
      TextEditingController usrController,
      TextEditingController passwordController,
      TextEditingController nombreController,
      TextEditingController apellidoController,
      TextEditingController numTelController,
      UserBloc userBloc,
      Map<String, List<String>?> fieldErrors,
      ) {
    fieldErrors.clear();

    final register = Register(
      usuario: usrController.text,
      contrasena: passwordController.text,
      nombre: nombreController.text,
      apellido: apellidoController.text,
      numTel: numTelController.text,
    );

    userBloc.add(RegisterEvent(register));
  }

}
