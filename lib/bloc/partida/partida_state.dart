part of 'partida_bloc.dart';

@immutable
abstract class PartidaState {}

class UserInitial extends PartidaState {}

class EsperandoRespuestaState extends PartidaState {
  EsperandoRespuestaState();
}

class BuscadorLoadingState extends PartidaState {
  BuscarpartidaResponse BuscadorRespuesta;
  BuscadorLoadingState(this.BuscadorRespuesta);
}

class BuscarPartidaLoadedState extends PartidaState {
  BuscarpartidaResponse BuscadorRespuesta;
  BuscarPartidaLoadedState(this.BuscadorRespuesta);
}

class ErrorBuscarPartidaState extends PartidaState {
  BuscarpartidaResponse BuscadorRespuesta;
  ErrorBuscarPartidaState(this.BuscadorRespuesta);
}

class VerCartasLoadingState extends PartidaState {
  VerManoResponse VerCartas;
  VerCartasLoadingState(this.VerCartas);
}

class VerCartasLoadedState extends PartidaState {
  VerManoResponse VerCartas;
  VerCartasLoadedState(this.VerCartas);
}

class ErrorVerCartasState extends PartidaState {
  VerManoResponse VerCartas;
  ErrorVerCartasState(this.VerCartas);
}

class VerTriunfoLoadingState extends PartidaState {
  VerTriunfoResponse VerTriunfo;
  VerTriunfoLoadingState(this.VerTriunfo);
}

class VerTriunfoLoadedState extends PartidaState {
  VerTriunfoResponse VerTriunfo;
  VerTriunfoLoadedState(this.VerTriunfo);
}

class ErrorVerTriunfoState extends PartidaState {
  VerTriunfoResponse VerTriunfo;
  ErrorVerTriunfoState(this.VerTriunfo);
}

class ComprobarGanadorLoadedState extends PartidaState {
  final bool haGanado;

  ComprobarGanadorLoadedState({required this.haGanado});
}

class SiguienteJugadorLoadedState extends PartidaState {
  final String siguienteJugador;
  SiguienteJugadorLoadedState({required this.siguienteJugador});
}

class CartaJugadaState extends PartidaState {
  final String mensaje;
  CartaJugadaState({required this.mensaje});
}

class CantoRealizadoState extends PartidaState {
  final String mensaje;
  final int puntos;
  CantoRealizadoState({required this.mensaje, required this.puntos});
}

class JugarCartaLoadedState extends PartidaState {
  final JugarCartaResponse repuestaJugada;
  JugarCartaLoadedState(this.repuestaJugada);
}

class JugarCartaLoadingState extends PartidaState {
  final JugarCartaResponse repuestaJugada;
  JugarCartaLoadingState(this.repuestaJugada);
}

class CartaJugadaRivalLoadedState extends PartidaState {
  final CartaJugadaRivalResponse repuestaCartaRivalJugada;
  CartaJugadaRivalLoadedState(this.repuestaCartaRivalJugada);
}

class CartaJugadaRivalLoadingState extends PartidaState {
  final CartaJugadaRivalResponse repuestaCartaRivalJugada;
  CartaJugadaRivalLoadingState(this.repuestaCartaRivalJugada);
}


