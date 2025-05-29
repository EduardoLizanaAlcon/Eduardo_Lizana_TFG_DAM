import 'package:flutter/material.dart';
import '../../bloc/user/user_bloc.dart';
import '../../util/funciones/FuncionalidadActualizarPress.dart';

class BotonActualizar {
  Widget getBotonActualizar(
      Map<String, List<String>?> fieldErrors,
      UserBloc userBloc,
      TextEditingController usrController,
      TextEditingController nombreController,
      TextEditingController apellidoController,
      TextEditingController telefonoController,
      ) {
    final funcionalidadActualizar = FuncionalidadActualizarPress();

    return Positioned(
      bottom: -30,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.blue[700],
        child: IconButton(
          icon: Icon(Icons.save, color: Colors.white),
          onPressed: () {
            funcionalidadActualizar.onUpdatePressed(
              usrController,
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