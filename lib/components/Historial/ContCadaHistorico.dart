// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tfg_ginyote/domain/historial/HistorialResponse.dart';

class ContCadaHistorico{
  Widget getContCadaHistorico(Partida partida){
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Equipo 1: ${partida.equipo1Nombres}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Equipo 2: ${partida.equipo2Nombres}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Divider(height: 20, color: Colors.grey),
            Text(
              'Resultado: ${partida.resultado}',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 8),
            Text(
              'Detalle de sets: ${partida.detalleSets}',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

}