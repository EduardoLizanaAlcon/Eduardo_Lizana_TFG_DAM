part of 'partida_bloc.dart';

@immutable
abstract class PartidaEvent {}

  class postBuscarPartidaEvent extends PartidaEvent{
    BuscarPartida buscador;
    postBuscarPartidaEvent(this.buscador);
  }

class postVerMano extends PartidaEvent{
  VerMano mano;
  postVerMano(this.mano);
}

class verTriunfo extends PartidaEvent{
  VerTriunfo verTriunf;
  verTriunfo(this.verTriunf);
}

class verGlobal extends PartidaEvent{
  VerGlobal global;
  verGlobal(this.global);
}






