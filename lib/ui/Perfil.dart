import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import 'package:tfg_ginyote/domain/user/User.dart';
import 'package:tfg_ginyote/util/UsuarioDatos.dart';
import '../bloc/user/user_bloc.dart';
import '../components/generics/BotonActualizar.dart';
import '../components/generics/ContenedorPerfilCard.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController usrController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final UserBloc userBloc = Injector.appInstance.get<UserBloc>();
  bool isLoading = false;

  Map<String, List<String>?> fieldErrors = {};

  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final usu = UsuarioDatos.getUsuario();
    setState(() {
      usrController.text = usu.usuario;
      nombreController.text = usu.nombre;
      apellidoController.text = usu.apellido;
      telefonoController.text = "${usu.numTel}";
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<UserBloc>(
        create: (_) => userBloc,
        child: BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is LoadingUpdateProfileState) {
              setState(() {
                isLoading = true;
              });
            } else {
              setState(() {
                isLoading = false;
              });
            }
            if (state is ErrorState) {
              showSnackBar("Actualización fallida", isError: true);
            } else if (state is ProfileUpdatedState) {
              showSnackBar("Perfil actualizado correctamente");
              UsuarioDatos.setUsuario(state.perfilResponse.usuario!);
            }
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  ContenedorPerfilCard().getCard_Perfil(
                    context,
                    usrController,
                    nombreController,
                    apellidoController,
                    telefonoController,
                    fieldErrors,
                  ),
                  BotonActualizar().getBotonActualizar(
                    fieldErrors,
                    userBloc,
                    usrController,
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
