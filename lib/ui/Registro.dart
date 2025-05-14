// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import '../bloc/user/user_bloc.dart';
import '../components/generics/BotonRegistro.dart';
import '../components/generics/ContenedorRegistroCard.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usrController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
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
            if (state is LoadingRegisterState) {
              setState(() {
                isLoading = true;
              });
            } else {
              setState(() {
                isLoading = false;
              });
            }
            if (state is ErrorState) {
              print("Registro fallido");
            } else if (state is RegistroState) {
              Navigator.pop(context);
            }
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  ContenedorRegistroCard().getCard_Registro(
                    context,
                    usrController,
                    passwordController,
                    nombreController,
                    apellidoController,
                    telefonoController,
                    fieldErrors,
                  ),
                  BotonRegistro().getBotonRegistro(
                    fieldErrors,
                    userBloc,
                    usrController,
                    passwordController,
                    nombreController,
                    apellidoController,
                    telefonoController,
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
