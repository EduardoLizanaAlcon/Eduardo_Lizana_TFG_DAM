import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import 'package:tfg_ginyote/bloc/partida/partida_bloc.dart';
import 'package:tfg_ginyote/domain/partida/JugarCarta.dart';
import 'package:tfg_ginyote/domain/partida/VerTriunfo.dart';
import 'package:tfg_ginyote/domain/user/User.dart';
import 'package:tfg_ginyote/util/UsuarioDatos.dart';
import '../../domain/partida/Carta.dart';
import '../../domain/partida/CartaJugadaRival.dart';
import '../../domain/partida/ComprobarRonda.dart';
import '../../domain/partida/VerMano.dart';
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

  List<Carta> misCartas = [];
  List<int> selectedCardIndices = [];
  List<Carta> cartasJugadas = [];
  Cartas? cartaTriunfo;
  String? siguienteJugador;
  bool esMiTurno = false;
  bool arrastre = false;
  Timer? _timer;
  Timer? _timerGanador;
  String? _ultimaCartaJugada;

  @override
  void initState() {
    super.initState();
    partidaBloc.add(postVerMano(VerMano(idBaraja: widget.idPartida, idJugador: usu.id)));
    partidaBloc.add(verTriunfo(VerTriunfo(idBaraja: widget.idPartida)));
    partidaBloc.add(ObtenerSiguienteJugadorEvent(idPartida: widget.idPartida));
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timerGanador?.cancel();
    super.dispose();
  }

  bool get puedeJugarCarta => selectedCardIndices.length == 1;

  bool get puedeCantar20 {
    if (selectedCardIndices.length < 2 || cartaTriunfo == null) return false;
    final seleccionadas = selectedCardIndices.map((i) => misCartas[i]).toList();
    final j = seleccionadas.where((c) => c.value == 'JACK');
    final k = seleccionadas.where((c) => c.value == 'KING');
    for (var jota in j) {
      for (var rey in k) {
        if (jota.suit == rey.suit && jota.suit != cartaTriunfo!.suit) return true;
      }
    }
    return false;
  }

  bool get puedeCantar40 {
    if (selectedCardIndices.length < 2 || cartaTriunfo == null) return false;
    final seleccionadas = selectedCardIndices.map((i) => misCartas[i]).toList();
    final j = seleccionadas.where((c) => c.value == 'JACK');
    final k = seleccionadas.where((c) => c.value == 'KING');
    for (var jota in j) {
      for (var rey in k) {
        if (jota.suit == rey.suit && jota.suit == cartaTriunfo!.suit) return true;
      }
    }
    return false;
  }

  int cartaComparator(Carta a, Carta b) {
    const orden = ['ACE', '3', 'KING', 'QUEEN', 'JACK', '7', '6', '5', '4', '2'];
    return orden.indexOf(a.value).compareTo(orden.indexOf(b.value));
  }

  List<int> obtenerIndicesCartasPermitidas() {
    if (!arrastre || cartasJugadas.isEmpty) {
      return List.generate(misCartas.length, (index) => index);
    }

    final cartaRival = cartasJugadas.last;
    final mismoPalo = <int>[];
    final triunfos = <int>[];

    for (int i = 0; i < misCartas.length; i++) {
      final carta = misCartas[i];
      if (carta.suit == cartaRival.suit) {
        mismoPalo.add(i);
      } else if (carta.suit == cartaTriunfo?.suit) {
        triunfos.add(i);
      }
    }

    if (mismoPalo.isNotEmpty) {
      return mismoPalo;
    } else if (triunfos.isNotEmpty) {
      return triunfos;
    } else {
      return List.generate(misCartas.length, (index) => index);
    }
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
      body: MultiBlocListener(
        listeners: [
          BlocListener<PartidaBloc, PartidaState>(
            bloc: partidaBloc,
            listenWhen: (prev, current) =>
            current is VerCartasLoadedState ||
                current is ErrorVerCartasState ||
                current is SiguienteJugadorLoadedState,
            listener: (context, state) {
              if (state is VerCartasLoadedState) {
                setState(() {
                  misCartas = List.from(state.VerCartas.cartas);
                  misCartas.sort((a, b) => cartaComparator(a, b));
                });
              } else if (state is ErrorVerCartasState) {
                _mostrarError("No se pudo cargar tu mano");
              } else if (state is SiguienteJugadorLoadedState) {
                setState(() {
                  siguienteJugador = state.siguienteJugador;
                  esMiTurno = (siguienteJugador == "${usu.id}");
                  if (!esMiTurno && _timer == null) {
                    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
                      partidaBloc.add(ObtenerSiguienteJugadorEvent(idPartida: widget.idPartida));
                    });
                  }
                  if (esMiTurno && _timer != null) {
                    _timer?.cancel();
                    _timer = null;
                  }
                  if (esMiTurno) {
                    partidaBloc.add(CartaJugadaRivalEvent(
                      BuscarCarta: CartaJugadaRival(
                        idJugador: "${usu.id}",
                        idBaraja: widget.idPartida,
                      ),
                    ));
                  }
                });
              }
            },
          ),
          BlocListener<PartidaBloc, PartidaState>(
            bloc: partidaBloc,
            listenWhen: (prev, current) => current is VerTriunfoLoadedState || current is ErrorVerTriunfoState,
            listener: (context, state) {
              if (state is VerTriunfoLoadedState) {
                setState(() {
                  cartaTriunfo = state.VerTriunfo.cartas.first;
                });
              } else if (state is ErrorVerTriunfoState) {
                _mostrarError("No se pudo cargar el triunfo");
              }
            },
          ),
          BlocListener<PartidaBloc, PartidaState>(
            bloc: partidaBloc,
            listenWhen: (prev, current) => current is CartaJugadaRivalLoadedState,
            listener: (context, state) {
              if (state is CartaJugadaRivalLoadedState && state.repuestaCartaRivalJugada.success) {
                final cartasRival = state.repuestaCartaRivalJugada.cartasRival;
                if (cartasRival != null && cartasRival.isNotEmpty) {
                  final carta = cartasRival.first;
                  setState(() {
                    if (!cartasJugadas.any((c) => c.code == carta.code)) {
                      cartasJugadas.add(Carta(
                        code: carta.code,
                        image: carta.image,
                        value: carta.value,
                        suit: carta.suit,
                        images: carta.images,
                      ));
                    }
                    arrastre = state.repuestaCartaRivalJugada.arrastre == true;
                  });
                }
              }
            },
          ),
          BlocListener<PartidaBloc, PartidaState>(
            bloc: partidaBloc,
            listenWhen: (prev, current) => current is JugarCartaLoadedState,
            listener: (context, state) {
              if (state is JugarCartaLoadedState) {
                final infoGanador = state.repuestaJugada.infoGanador;
                if (infoGanador != null && infoGanador.success == true) {
                  final int? idGanador = infoGanador.ganador;
                  final int miId = usu.id;
                  final bool gane = idGanador == miId;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(gane ? '¡Has ganado la ronda!' : 'Has perdido la ronda'),
                      duration: const Duration(seconds: 2),
                    ),
                  );

                  partidaBloc.add(postVerMano(VerMano(
                    idBaraja: widget.idPartida,
                    idJugador: usu.id,
                  )));
                  partidaBloc.add(ObtenerSiguienteJugadorEvent(idPartida: widget.idPartida));
                  setState(() {
                    cartasJugadas.clear();
                  });
                } else {
                  _timerGanador?.cancel();
                  _timerGanador = Timer.periodic(const Duration(seconds: 2), (_) {
                    partidaBloc.add(ComprobarGanadorEvent(
                      comprobarRonda: ComprobarRonda(
                        idCarta: _ultimaCartaJugada!,
                        idBaraja: widget.idPartida,
                      ),
                    ));
                  });
                }
              }
            },
          ),
          BlocListener<PartidaBloc, PartidaState>(
            bloc: partidaBloc,
            listenWhen: (prev, current) => current is ComprobarGanadorLoadedState,
            listener: (context, state) {
              if (state is ComprobarGanadorLoadedState) {
                _timerGanador?.cancel();
                final ganador = state.ganador;

                partidaBloc.add(postVerMano(VerMano(
                  idBaraja: widget.idPartida,
                  idJugador: usu.id,
                )));
                partidaBloc.add(ObtenerSiguienteJugadorEvent(idPartida: widget.idPartida));

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('¡Esta ronda la ha ganado $ganador!'),
                    duration: const Duration(seconds: 2),
                  ),
                );

                setState(() {
                  cartasJugadas.clear();
                });
              }
            },
          ),
        ],
        child: BlocBuilder<PartidaBloc, PartidaState>(
          bloc: partidaBloc,
          builder: (context, state) {
            final cargando = state is EsperandoRespuestaState;

            return Stack(
              children: [
                _buildContenidoPartida(state),
                if (cargando)
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.4),
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Menú inferior', textAlign: TextAlign.center),
        ),
      ),
    );
  }

  Widget _buildContenidoPartida(PartidaState state) {
    final indicesPermitidos = obtenerIndicesCartasPermitidas();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text("Recorrido de la partida", style: TextStyle(fontWeight: FontWeight.bold)),
              if (siguienteJugador != null)
                Text(
                  esMiTurno ? "¡Es tu turno!" : "Turno de $siguienteJugador",
                  style: TextStyle(
                    color: esMiTurno ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          child: Stack(
            children: [
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: (esMiTurno && puedeCantar20 && siguienteJugador != null)
                          ? () {
                        partidaBloc.add(Cantar20Event(
                          idPartida: widget.idPartida,
                          idJugador: usu.id,
                        ));
                      }
                          : null,
                      child: const Text("Cantar 20"),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: (esMiTurno && puedeCantar40 && siguienteJugador != null)
                          ? () {
                        partidaBloc.add(Cantar40Event(
                          idPartida: widget.idPartida,
                          idJugador: usu.id,
                        ));
                      }
                          : null,
                      child: const Text("Cantar 40"),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: (esMiTurno &&
                          puedeJugarCarta &&
                          siguienteJugador != null &&
                          indicesPermitidos.contains(selectedCardIndices.first))
                          ? () {
                        final cartaSeleccionada = misCartas[selectedCardIndices.first];
                        _ultimaCartaJugada = cartaSeleccionada.code;

                        partidaBloc.add(
                          JugarCartaEvent(
                            cartaJugada: JugarCarta(
                              idBaraja: widget.idPartida,
                              idJugador: usu.id,
                              carta: cartaSeleccionada.code,
                              primero: cartasJugadas.isEmpty,
                            ),
                          ),
                        );

                        setState(() {
                          misCartas.removeAt(selectedCardIndices.first);
                          selectedCardIndices.clear();
                          esMiTurno = false;
                        });
                      }
                          : null,
                      child: const Text("Jugar Carta"),
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
              final isSelected = selectedCardIndices.contains(index);
              final esPermitida = indicesPermitidos.contains(index);

              return GestureDetector(
                onTap: () {
                  if (esMiTurno && siguienteJugador != null && esPermitida) {
                    setState(() {
                      if (isSelected) {
                        selectedCardIndices.remove(index);
                      } else {
                        selectedCardIndices.clear();
                        selectedCardIndices.add(index);
                      }
                    });
                  }
                },
                child: Opacity(
                  opacity: esPermitida ? 1.0 : 0.3,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: EdgeInsets.only(
                      top: isSelected ? 0 : 20,
                      left: 8,
                      right: 8,
                    ),
                    decoration: BoxDecoration(
                      border: isSelected ? Border.all(color: Colors.green, width: 3) : null,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(carta.image, height: 100),
                  ),
                ),
              );
            },
          ),
        ),
      ],
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
