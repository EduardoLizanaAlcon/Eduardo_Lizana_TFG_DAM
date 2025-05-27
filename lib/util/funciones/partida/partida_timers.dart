import 'package:flutter/cupertino.dart';
import '../../bloc/user/user_bloc.dart';
import '../../domain/user/Login.dart';

class Funcionalidadloginpress {
  Map<String, List<String>?> fieldErrors = {};

  void onLoginPressed(
      TextEditingController usrController,
      UserBloc userBloc,
      TextEditingController passwordController,
      Map<String, List<String>?> fieldErrors,
      ) {
    fieldErrors.clear();

    final login = Login(
      usuario: usrController.text,
      password: passwordController.text,
    );

    userBloc.add(LoginEvent(login));
  }
}
