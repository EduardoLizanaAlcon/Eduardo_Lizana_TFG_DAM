part of 'partida_bloc.dart';

@immutable
abstract class PartidaState {}

class UserInitial extends PartidaState {}

class BuscadorLoadingState extends PartidaState{
  BuscarpartidaResponse BuscadorRespuesta;
  BuscadorLoadingState(this.BuscadorRespuesta);
}

class BuscarPartidaLoadedState extends PartidaState{
  BuscarpartidaResponse BuscadorRespuesta;
  BuscarPartidaLoadedState(this.BuscadorRespuesta);
}

class ErrorBuscarPartidaState extends PartidaState{
  BuscarpartidaResponse BuscadorRespuesta;
  ErrorBuscarPartidaState(this.BuscadorRespuesta);
}

class VerCartasLoadingState extends PartidaState{
  VerManoResponse VerCartas;
  VerCartasLoadingState(this.VerCartas);
}

class VerCartasLoadedState extends PartidaState{
  VerManoResponse VerCartas;
  VerCartasLoadedState(this.VerCartas);
}

class ErrorVerCartasState extends PartidaState{
  VerManoResponse VerCartas;
  ErrorVerCartasState(this.VerCartas);
}

class VerTriunfoLoadingState extends PartidaState{
  VerTriunfoResponse VerTriunfo;
  VerTriunfoLoadingState(this.VerTriunfo);
}

class VerTriunfoLoadedState extends PartidaState{
  VerTriunfoResponse VerTriunfo;
  VerTriunfoLoadedState(this.VerTriunfo);
}

class ErrorVerTriunfoState extends PartidaState{
  VerTriunfoResponse VerTriunfo;
  ErrorVerTriunfoState(this.VerTriunfo);
}