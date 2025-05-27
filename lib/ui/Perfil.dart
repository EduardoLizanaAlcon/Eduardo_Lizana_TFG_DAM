// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import 'package:tfg_ginyote/domain/user/User.dart';
import 'package:tfg_ginyote/ui/PaginaInicio.dart';
import '../bloc/user/user_bloc.dart';
import '../components/generics/BotonInicioSesion.dart';
import '../components/generics/ContenedorLoginCard.dart';
import '../util/UsuarioDatos.dart';

class PefilScreen extends StatefulWidget {
  @override
  _PefilScreenState createState() => _PefilScreenState();
}

class _PefilScreenState extends State<PefilScreen> {
  final TextEditingController usrController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final UserBloc userBloc = Injector.appInstance.get<UserBloc>();
  bool isLoading = false;

  Map<String, List<String>?> fieldErrors = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<UserBloc>(
        create: (_) => userBloc,
        child: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is LoadingLoginState) {
              setState(() {
                isLoading = true;
              });
            } else {
              setState(() {
                isLoading = false;
              });
            }

            if (state is ErrorLoginState) {
              print("Login error");
            } else if (state is LoginState) {
              UsuarioDatos.setUsuario(state.loginResponse.usuario!);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Paginainicio()),
              );
            }
          },

          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Contenedorlogincard().getCard_Login(
                    context,
                    usrController,
                    passwordController,
                    fieldErrors,
                  ),
                  Botoniniciosesion().getBotoniniciosesion(
                    fieldErrors, userBloc, usrController, passwordController,
                  ),
                  if (isLoading)
                    Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.3),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    ),
                ],
              ),

            ),
          ),
        ),
      ),
    );
  }
}
