import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import 'package:tfg_ginyote/bloc/partida/partida_bloc.dart';
import 'package:tfg_ginyote/domain/partida/VerTriunfo.dart';
import 'package:tfg_ginyote/domain/user/User.dart';
import 'package:tfg_ginyote/util/UsuarioDatos.dart';
import '../../domain/partida/VerGlobalResponse.dart';
import '../../domain/partida/VerMano.dart';
import '../../domain/partida/VerManoResponse.dart';
import '../../domain/partida/VerTriunfoResponse.dart';

class PaginaDePartida extends StatefulWidget {
  final String idPartida;

  const PaginaDePartida({required this.idPartida, Key? key}) : super(key: key);

  @override
  State<PaginaDePartida> createState() => _PaginaDePartidaState();
}

class _PaginaDePartidaState extends State<PaginaDePartida> {
  final PartidaBloc partidaBloc = Injector.appInstance.get<PartidaBloc>();
  final Usuario usu = UsuarioDatos.getUsuario();

  late List<Carta> misCartas= [];
  List<Carta> cartasJugadas = [];
  Cartas? cartaTriunfo;
  int? selectedCardIndex;

  @override
  void initState() {
    super.initState();
    partidaBloc.add(postVerMano(VerMano(idBaraja: widget.idPartida, idJugador: usu.id)));
    partidaBloc.add(verTriunfo(VerTriunfo(idBaraja: widget.idPartida)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Partida"),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: _buildBodyContent(),

      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Menú inferior', textAlign: TextAlign.center),
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    return BlocBuilder<PartidaBloc, PartidaState>(
      bloc: partidaBloc,
      builder: (context, state) {
        // Estado de cartas (mano)
        if (state is VerCartasLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is VerCartasLoadedState) {
          misCartas = state.VerCartas.cartas;
        }

        if (state is ErrorVerCartasState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _mostrarError("No se pudo cargar tu mano");
          });
        }

        // Estado del triunfo
        if (state is VerTriunfoLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is VerTriunfoLoadedState) {
          cartaTriunfo = state.VerTriunfo.cartas.first;
        }

        if (state is ErrorVerTriunfoState) {
          return const Center(child: Text("No se pudo cargar el triunfo"));
        }

        // Renderizado principal
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Recorrido de la partida", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    left: 16,
                    top: 80,
                    child: Image.asset('assets/images/back_card.png', height: 100),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: cartasJugadas
                          .map((carta) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Image.network(carta.image, height: 100),
                      ))
                          .toList(),
                    ),
                  ),
                  if (cartaTriunfo != null)
                    Positioned(
                      bottom: 150,
                      right: 16,
                      child: Image.network(cartaTriunfo!.image, height: 80),
                    ),
                  Positioned(
                    bottom: 200,
                    left: 16,
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // TODO: Acción para cantar 20
                          },
                          child: const Text("Cantar 20"),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            // TODO: Acción para cantar 40
                          },
                          child: const Text("Cantar 40"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 140,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: misCartas.length,
                itemBuilder: (context, index) {
                  final carta = misCartas[index];
                  final isSelected = selectedCardIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCardIndex = isSelected ? null : index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: EdgeInsets.only(
                        top: isSelected ? 0 : 20,
                        left: 8,
                        right: 8,
                      ),
                      child: Image.network(carta.image, height: 100),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void _mostrarError(String mensaje) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Error"),
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
