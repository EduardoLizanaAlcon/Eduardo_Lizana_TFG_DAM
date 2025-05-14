part of 'historial_bloc.dart';

@immutable
abstract class HistorialEvent {}

  class getHistorialEvent extends HistorialEvent{
    Historial historico;
    getHistorialEvent(this.historico);
  }





