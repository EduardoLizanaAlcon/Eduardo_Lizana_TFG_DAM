import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tfg_ginyote/domain/partida/BuscarpartidaResponse.dart';
import 'package:tfg_ginyote/domain/partida/EnviarBuscarPartida.dart';
import 'package:tfg_ginyote/domain/partida/VerMano.dart';
import 'package:tfg_ginyote/domain/partida/VerTriunfoResponse.dart';
import '../../domain/partida/VerGlobal.dart';
import '../../domain/partida/VerManoResponse.dart';
import '../../domain/partida/VerTriunfo.dart';
import '../../use-cases/partida/BuscarPartidaUserCase.dart';
import '../../use-cases/partida/VerGlobalUserCase.dart';
import '../../use-cases/partida/VerManoUserCase.dart';
import '../../use-cases/partida/VerTriunfoUserCase.dart';
part 'partida_event.dart';
part 'partida_state.dart';

class PartidaBloc extends Bloc<PartidaEvent, PartidaState> {
  BuscarPartidaUserCase? _buscarPartidaUserCase;
  VerManoUserCase? _verManoUserCasa;
  VerTriunfoUserCase? _verTriunfoUserCase;
  VerGlobalUserCase? _verGlobalUserCase;

  PartidaBloc(this._buscarPartidaUserCase, this._verManoUserCasa, this._verTriunfoUserCase, this._verGlobalUserCase) : super(UserInitial()) {
    on<postBuscarPartidaEvent>((event, emit) async{
      final response = await _buscarPartidaUserCase!.postBuscarPartida(event.buscador);

      if (response!.success) {
        emit(BuscarPartidaLoadedState(response));
      }else{
        emit(BuscadorLoadingState(response));
      }

    });
    on<postVerMano>((event, emit) async{
      final response = await _verManoUserCasa!.postVerMano(event.mano);
      if (response!.success) {
        emit(VerCartasLoadedState(response));
      }else{
        emit(ErrorVerCartasState(response));
      }
    });
    on<verTriunfo>((event, emit) async{
      final response = await _verTriunfoUserCase!.postVerTriunfo(event.verTriunf);
      if (response!.success) {
        emit(VerTriunfoLoadedState(response));
      }else{
        emit(VerTriunfoLoadingState(response));
      }
    });
    on<verGlobal>((event, emit) async{
      final response = await _verGlobalUserCase!.postVerGlobal(event.global);
      if (response!.success) {
        emit(BuscarPartidaLoadedState(response));
      }else{
        emit(BuscadorLoadingState(response));
      }
    });
  }
}

