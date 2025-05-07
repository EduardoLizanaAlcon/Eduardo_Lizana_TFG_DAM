import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Colores.dart';

class Styles {
  static TextStyle getStyleTituto (){
    return TextStyle(
      fontFamily: 'ArialRoundedMTBold', // Nombre de la fuente a registrar
      fontWeight: FontWeight.w400, // Peso 400 (normal)
      fontSize: 24, // Tamaño 24px
      height: 28 / 24, // Line height: 28px (calculado como relación con fontSize)
      letterSpacing: 0, // Espaciado entre letras 0px
      color: Colores.getColorAzulCasiNegro(), // Color del texto
    );
  }

  static BoxDecoration contenedorMenuInferior(){
   return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withAlpha(50),
          blurRadius: 10,
          spreadRadius: 2,
          offset: Offset(0, -3),
        ),
      ],
    );
  }

  static BoxDecoration contenedorNotificacionAntigua(){
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: Colors.grey[300]!,
        width: 1,
      ),
      boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 5,
          spreadRadius: 2,
          offset: Offset(3, 3),
        ),
      ],
    );
  }

  static BoxDecoration contenedorNotificacionHoy(){
    return BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.30, 0.75, 1.0],
            colors: [
              Colores.getColorRosadoPrincipal(),
              Colores.getColorRosaDegradado(),
              Colores.getColorBlanco(),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(3, 3),
            ),
          ],
        );
  }

  static BoxDecoration contenedorPopup(Color colo){
    return  BoxDecoration(
      color: colo,
      borderRadius: BorderRadius.circular(20),
    );
  }

  static TextStyle textopoup(){
    return TextStyle(
      fontSize: 22,
      color: Colors.white,
      decoration: TextDecoration.none,
    );
  }

  static BoxDecoration ContenedorVideoFondoPadre(){
    return  const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 10,
          spreadRadius: 2,
          offset: Offset(0, -3),
        ),
      ],
    );
  }

  static BoxDecoration ContenedorVideoFondoDegradado(){
    return  BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        stops: [0.25, 1.0, 1.0],
        colors: [
          Colores.getColorRosadoPrincipalTranslucido(),
          Colores.getColorMarron(),
          Colores.getColorRosaDegradado(),
        ],
      ),
    );
  }

  static TextStyle textoContendorVideoFondo(double textSize){
    return TextStyle(
      fontSize: textSize,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  static InputDecoration estilosBotonesRegistro(
      String? i,
      String t,
      Icon? icono, {
        bool isError = true,
        String? errorText = "Desconocido",
      }) {
    return InputDecoration(
      prefixIcon: i != null ? Image.asset(i) : icono != null ? icono : null,
      hintText: t,
      hintStyle: const TextStyle(color: Colors.white),
      filled: true,
      fillColor: Colors.white10,
      errorText: errorText,
      errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: isError ? Colors.red : Colors.white,
          width: 1.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: isError ? Colors.red : Colors.white,
          width: 2.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2.0,
        ),
      ),
    );
  }

  static BoxDecoration estilosContenedorRegistro() {
    return BoxDecoration(
      color: Colors.white10,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(color: Colors.white10),
    );

  }

}