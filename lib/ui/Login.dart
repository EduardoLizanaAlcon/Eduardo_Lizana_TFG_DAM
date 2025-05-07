// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import 'package:tfg_ginyote/domain/user/User.dart';
import '../bloc/user/user_bloc.dart';
import '../components/generics/BotonInicioSesion.dart';
import '../components/generics/ContenedorLoginCard.dart';
import '../util/UsuarioDatos.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usrController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final UserBloc userBloc = Injector.appInstance.get<UserBloc>();

  Map<String, List<String>?> fieldErrors = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<UserBloc>(
        create: (_) => userBloc,
        child: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is ErrorLoginState) {
              print("objectobjectobjectobjectobjectobjectobjectobjectobjectobjectobjectobject");
            } else if (state is LoginState) {
              print("Puedes entrar");
              UsuarioDatos.setUsuario(state.loginResponse.usuario);
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
                      fieldErrors
                  ),
                  Botoniniciosesion().getBotoniniciosesion(fieldErrors, userBloc, usrController, passwordController),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
