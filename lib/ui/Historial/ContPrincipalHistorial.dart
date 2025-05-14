// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import 'package:tfg_ginyote/domain/user/User.dart';
import 'package:tfg_ginyote/util/UsuarioDatos.dart';
import '../../bloc/historial/historial_bloc.dart';
import '../../components/Historial/ContCadaHistorico.dart';
import '../../domain/historial/EnviarAHIstorial.dart';


class Contprincipalhistorial extends StatefulWidget {
  @override
  _Contprincipalhistorialstate createState() => _Contprincipalhistorialstate();
}

class _Contprincipalhistorialstate extends State<Contprincipalhistorial> {
  final HistorialBloc historialBloc = Injector.appInstance.get<HistorialBloc>();
  dynamic historialData;

  Usuario usu = UsuarioDatos.getUsuario();

  @override
  void initState() {
    super.initState();

    historialBloc.add(getHistorialEvent(Historial(idUsuario: usu.id)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My App"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: BlocProvider<HistorialBloc>(
        create: (_) => historialBloc,
        child: BlocListener<HistorialBloc, HistorialState>(
          listener: (context, state) {
            if (state is HistorialLoadedState) {
              setState(() {
                historialData = state.Historico.partidas;
              });
            } else if (state is ErrorHistorialState) {
              // Manejar errores
              print("Error al cargar el historial: ${state.Historico.mensaje}");
            }
          },
          child: BlocBuilder<HistorialBloc, HistorialState>(
            builder: (context, state) {
              if (state is HistorialLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is HistorialLoadedState) {
                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: historialData.length,
                  itemBuilder: (context, index) {
                    final partida = historialData[index];
                    return ContCadaHistorico().getContCadaHistorico(partida);
                  },
                );
              } else if (state is ErrorHistorialState) {
                return Center(child: Text('Error al cargar el historial'));
              }
              return Center(child: Text('Presiona para cargar historial'));
            },
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