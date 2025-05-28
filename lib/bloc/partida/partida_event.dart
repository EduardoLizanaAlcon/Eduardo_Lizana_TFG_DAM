part of 'partida_bloc.dart';

@immutable
abstract class PartidaEvent {}

class postBuscarPartidaEvent extends PartidaEvent {
  BuscarPartida buscador;
  postBuscarPartidaEvent(this.buscador);
}

class postVerMano extends PartidaEvent {
  VerMano mano;
  postVerMano(this.mano);
}

class verTriunfo extends PartidaEvent {
  VerTriunfo verTriunf;
  verTriunfo(this.verTriunf);
}

class verGlobal extends PartidaEvent {
  VerGlobal global;
  verGlobal(this.global);
}

class ObtenerSiguienteJugadorEvent extends PartidaEvent {
  final String idPartida;
  ObtenerSiguienteJugadorEvent({required this.idPartida});
}

class JugarCartaEvent extends PartidaEvent {
  final JugarCarta cartaJugada;

  JugarCartaEvent({
    required this.cartaJugada
  });
}

class CartaJugadaRivalEvent extends PartidaEvent {
  final CartaJugadaRival BuscarCarta;

  CartaJugadaRivalEvent({
    required this.BuscarCarta,
  });
}

class ComprobarGanadorEvent extends PartidaEvent {
  final ComprobarRonda comprobarRonda;


  ComprobarGanadorEvent({required this.comprobarRonda});
}

class CambiarTriunfoEvent extends PartidaEvent {
  final CambiarTriunfo comprobarRonda;

  CambiarTriunfoEvent(this.comprobarRonda);
}

class Cantar20Event extends PartidaEvent {
  final String idPartida;
  final int idJugador;

  Cantar20Event({
    required this.idPartida,
    required this.idJugador,
  });
}

class Cantar40Event extends PartidaEvent {
  final String idPartida;
  final int idJugador;

  Cantar40Event({
    required this.idPartida,
    required this.idJugador,
  });
}