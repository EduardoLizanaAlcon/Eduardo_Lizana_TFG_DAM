// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import 'package:tfg_ginyote/bloc/partida/partida_bloc.dart';
import 'package:tfg_ginyote/domain/partida/EnviarBuscarPartida.dart';
import 'package:tfg_ginyote/domain/user/User.dart';
import 'package:tfg_ginyote/ui/Partida/PaginaDePartida.dart';
import '../bloc/user/user_bloc.dart';
import '../components/generics/BotonInicioSesion.dart';
import '../components/generics/ContenedorLoginCard.dart';
import '../util/UsuarioDatos.dart';
import 'Historial/ContPrincipalHistorial.dart';

class Paginainicio extends StatefulWidget {
  @override
  _Paginainiciostate createState() => _Paginainiciostate();
}

class _Paginainiciostate extends State<Paginainicio> {
  PartidaBloc partidaBloc =  Injector.appInstance.get<PartidaBloc>();
  Usuario usu = UsuarioDatos.getUsuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My App"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: BlocListener<PartidaBloc, PartidaState>(
        bloc: partidaBloc, // Usa tu instancia directamente
        listener: (context, state) {
          if (state is BuscadorLoadingState) {
            print("Buscando partida... ${state.BuscadorRespuesta}");
            Future.delayed(
              Duration(seconds: 2),
                  () {
                partidaBloc.add(postBuscarPartidaEvent(BuscarPartida(id_usuario: usu.id)));
              },
            );

          } else if (state is BuscarPartidaLoadedState) {
            // Puedes navegar a otra pantalla si quieres
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaginaDePartida(idPartida: state.BuscadorRespuesta.informacionCreada!.idBaraja)),
            );
          } else if (state is ErrorBuscarPartidaState) {
            print("Error al buscar partida: ${state.BuscadorRespuesta}");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error al buscar partida')),
            );
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("1º opción");
                  },
                  child: Text("Perfil"),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    partidaBloc.add(postBuscarPartidaEvent(BuscarPartida(id_usuario: usu.id)));
                  },
                  child: Text("Buscar Partida"),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Contprincipalhistorial()),
                    );
                  },
                  child: Text("Historial"),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Bottom Navigation',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
