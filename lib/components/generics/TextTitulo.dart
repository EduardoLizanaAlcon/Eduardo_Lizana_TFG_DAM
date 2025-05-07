import 'package:flutter/material.dart';
import '../../util/Colores.dart';

//NOTA: *Normalmente no se piensa en el futuro lejano per pero en el caso de los componentes si, porque se suelen reutilizar en evolutivos.

//Separar cada componente en un fichero. Que reciban los parametros para poder ser reutilizados en cualquier momento aunque ahora no sea necesario, no sabemos si en futuro lo será

class TextTitulo {
  Widget GetTextTitulo(String text) {
    return Text(
      text,
      textAlign: TextAlign.center, // Alineación horizontal centrada
      style: TextStyle(
        fontFamily: 'ArialRoundedMTBold', // Nombre de la fuente a registrar
        fontWeight: FontWeight.w400, // Peso 400 (normal)
        fontSize: 24, // Tamaño 24px
        height: 28 / 24, // Line height: 28px (calculado como relación con fontSize)
        letterSpacing: 0, // Espaciado entre letras 0px
        color: Colores.getColorAzulCasiNegro(), // Color del texto
      ),
    );
  }

  Widget GetTextBienvenida(String text) {
    return Text(
      text,
      textAlign: TextAlign.left, // Alineación horizontal a la izquierda
      style: TextStyle(
        fontFamily: 'ArialRoundedMTBold',
        fontWeight: FontWeight.w400,
        fontSize: 40,          // 40px
        height: 46 / 40,       // Line height 46px (46/40)
        letterSpacing: 0,      // 0px
        color: Colores.getColorAzulCasiNegro(),
      ),
    );
  }

}

class TextoNotificaciones {

  Widget GetTitulo(String titulo, bool hoy) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 32),
      child: Text(
        titulo,

        style: TextStyle(
          fontSize: 24,
          color:  hoy ?  Colors.white : Colors.black,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1, // Opcional: define cuántas líneas mostrar antes del ellipsis
      ),
    );
  }

  Widget GetFecha(String fecha, bool hoy) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 32),
      child: Text(
        fecha,
        style: TextStyle(
          fontSize: 16,
          color:  hoy ?  Colors.white: Colors.black ,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2, // Opcional: define cuántas líneas mostrar antes del ellipsis
      ),
    );
  }

}

class TextoEjercicios{
  Widget GetTituloEjercicioMenu(String texto, bool abierto) {
    final activeColor = Colores.getColorRosadoPrincipal();

    return Container(
      width: 198,
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 25,
          color: abierto ? activeColor : Colors.white,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2, // Opcional: define cuántas líneas mostrar antes del ellipsis
      ),
    );
  }

  Widget GetSubTituloEjercicioMenu(String texto, bool abierto) {
    final activeColor = Colores.getColorRosadoPrincipal();
    final inactiveColor = Colores.getColorAzulCasiNegro();

    return Container(
      width: 126,
      height: 48,
      child: Text(
        texto,
        style: TextStyle(
          fontSize: abierto ? 16 : 18,
          color: abierto ? activeColor : Colors.white,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2, // Opcional: define cuántas líneas mostrar antes del ellipsis
      ),
    );
  }

  Widget getTituloEjercicio(String texto){
    return Text(
              texto,
              style: const TextStyle(
                fontSize: 24,
                color:Colors.white,
              ),
          );
  }

  Widget getSubTituloEjercicio(String texto){
    return Text(
        texto,
        style: const TextStyle(
          fontSize: 16,
          color:Colors.white,
        ),
        maxLines: 2, // Opcional: define cuántas líneas mostrar antes del ellipsis
      );
  }

  Widget getEnunciadoEjercicio(String texto){
    return Text(
        texto,
        style: const TextStyle(
          fontSize: 22,
          color:Colors.white,
        ),
      softWrap: true, // se asegura de que el texto haga wrap
      );
  }
}