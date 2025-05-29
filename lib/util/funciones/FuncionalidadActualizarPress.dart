import 'package:flutter/cupertino.dart';
import 'package:tfg_ginyote/util/UsuarioDatos.dart';
import '../../bloc/user/user_bloc.dart';
import '../../domain/user/PerfilEnviar.dart';


class FuncionalidadActualizarPress {
  final usu = UsuarioDatos.getUsuario();
  void onUpdatePressed(
      TextEditingController usrController,
      TextEditingController nombreController,
      TextEditingController apellidoController,
      TextEditingController numTelController,
      UserBloc userBloc,
      Map<String, List<String>?> fieldErrors,
      ) {
    fieldErrors.clear();

    final numTelStr = numTelController.text.trim();

    final numTelInt = int.tryParse(numTelStr);
    if (numTelInt == null) {
      fieldErrors['num_tel'] = ['Número inválido'];
      return;
    }

    final updateProfile = PerfilEnviar(
      idUsuario: usu.id,
      usuario: usrController.text.trim(),
      nombre: nombreController.text.trim(),
      apellido: apellidoController.text.trim(),
      numTel: numTelInt,
    );

    userBloc.add(UpdateProfileEvent(updateProfile));
  }
}
