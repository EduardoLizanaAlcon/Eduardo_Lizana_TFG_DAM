import 'package:flutter/material.dart';
import '../../ui/Registro.dart';
import 'TextFieldBlanco.dart';
import 'TextFieldNumeroTelefono.dart';
import 'TextSubtitulo.dart';
import 'TextTitulo.dart';


class Contenedorlogincard {
  Widget getCard_Login(BuildContext context, TextEditingController usrController,  TextEditingController passwordController, Map<String, List<String>?> fieldErrors) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image.asset('assets/icons/generic/baraja.png'),
            SizedBox(height: 20),
            TextTitulo().GetTextTitulo('Iniciar sesión'),
            SizedBox(height: 10),
            TextSubtitulo().GetTextSubtitulo(
              '¡Hola otra vez! Introduce tus datos para entrar en Páginas vivas!',
            ),
            SizedBox(height: 20),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: usrController,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 14), // Ajuste vertical del contenido
                      prefixIcon: Icon(Icons.phone, color: Colors.black54),
                      hintText: "Usuario",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            TextFieldBlanco().GetTextField(
              passwordController,
              'Escribe la contraseña',
              Icons.password,
              errorText: fieldErrors['password']?.first,
            ),

            SizedBox(height: 50),
            GestureDetector(
              onTap: () =>{
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                )
              },
              child: const Text(
                "¿No tienes cuenta?",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
