import 'package:flutter/material.dart';
import 'TextFieldBlanco.dart';
import 'TextFieldBlancoSimple.dart';
import 'TextFieldNumeroTelefono.dart';
import 'TextSubtitulo.dart';
import 'TextTitulo.dart';

class ContenedorPerfilCard {
  Widget getCard_Perfil(
      BuildContext context,
      TextEditingController usrController,
      TextEditingController nombreController,
      TextEditingController apellidoController,
      TextEditingController telefonoController,
      Map<String, List<String>?> fieldErrors,
      ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
            TextTitulo().GetTextTitulo('Editar Perfil'),
            SizedBox(height: 10),
            TextSubtitulo().GetTextSubtitulo(
              'Actualiza tus datos personales.',
            ),
            SizedBox(height: 20),

            TextFieldBlancoSimple().GetTextField(
              usrController,
              'Nombre de usuario',
              Icons.person,
              errorText: fieldErrors['usuario']?.first,
            ),
            SizedBox(height: 15),

            TextFieldBlancoSimple().GetTextField(
              nombreController,
              'Nombre',
              Icons.badge,
              errorText: fieldErrors['nombre']?.first,
            ),
            SizedBox(height: 15),

            TextFieldBlancoSimple().GetTextField(
              apellidoController,
              'Apellido',
              Icons.family_restroom,
              errorText: fieldErrors['apellido']?.first,
            ),
            SizedBox(height: 15),

            TextFieldNumeroTelefono().GetTextField(
              telefonoController,
              'Teléfono',
              "34",
              errorText: fieldErrors['num_tel']?.first,
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}