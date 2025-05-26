import 'package:flutter/material.dart';
import 'TextFieldBlanco.dart';
import 'TextFieldNumeroTelefono.dart';
import 'TextSubtitulo.dart';
import 'TextTitulo.dart';

class ContenedorRegistroCard {
  Widget getCard_Registro(
      BuildContext context,
      TextEditingController usrController,
      TextEditingController passwordController,
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
            // Image.asset('assets/icons/generic/registro.png'), // Cambia el ícono si deseas
            SizedBox(height: 20),
            TextTitulo().GetTextTitulo('Crear cuenta'),
            SizedBox(height: 10),
            TextSubtitulo().GetTextSubtitulo(
              'Introduce los datos para registrarte en Páginas Vivas.',
            ),
            SizedBox(height: 20),

            TextFieldBlanco().GetTextField(
              usrController,
              'Nombre de usuario',
              Icons.person,
              errorText: fieldErrors['usuario']?.first,
            ),
            SizedBox(height: 15),

            TextFieldBlanco().GetTextField(
              passwordController,
              'Contraseña',
              Icons.lock,
              errorText: fieldErrors['contrasena']?.first,
            ),
            SizedBox(height: 15),

            TextFieldBlanco().GetTextField(
              nombreController,
              'Nombre',
              Icons.badge,
              errorText: fieldErrors['nombre']?.first,
            ),
            SizedBox(height: 15),

            TextFieldBlanco().GetTextField(
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
