part of 'historial_bloc.dart';

@immutable
abstract class HistorialState {}

class UserInitial extends HistorialState {}

class HistorialLoadingState extends HistorialState{
  HistorialLoadingState();
}

class HistorialLoadedState extends HistorialState{
  HistorialResponse Historico;
  HistorialLoadedState(this.Historico);
}

class ErrorHistorialState extends HistorialState{
  HistorialResponse Historico;
  ErrorHistorialState(this.Historico);
}