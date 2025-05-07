import 'package:flutter/material.dart';
import '../../util/Styles.dart';

class TextfieldRegistro {
  Widget GetTextFieldRegistro(String image, String hint, TextEditingController controller, {bool bolerro=false, String? err}){
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: Styles.estilosBotonesRegistro(image, hint, null,  isError: bolerro, errorText: err,),
    );
  }
}