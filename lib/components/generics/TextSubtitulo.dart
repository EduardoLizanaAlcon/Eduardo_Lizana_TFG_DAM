import 'package:flutter/material.dart';
import '../../util/Colores.dart';

class TextSubtitulo {
  Widget GetTextSubtitulo(String text) {
    return Align(
      alignment: Alignment.center, // Alineación vertical media
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0), // Espaciado vertical
        child: Text(
          text,
          textAlign: TextAlign.center, // Alineación horizontal centrada
          style: TextStyle(
            fontFamily: 'ArialRoundedMTBold', // Fuente especificada
            fontWeight: FontWeight.w400, // Peso 400
            fontSize: 16, // Tamaño 16px
            height: 24 / 16, // Line height 24px (1.5)
            letterSpacing: 0, // Espaciado entre letras 0px
            color: Colores.getColorAzulCasiNegro(), // Color del texto
          ),
        ),
      ),
    );
  }
}