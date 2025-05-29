import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tfg_ginyote/domain/partida/BuscarpartidaResponse.dart';
import 'package:tfg_ginyote/domain/partida/CambiarTriunfoResponse.dart';
import 'package:tfg_ginyote/domain/partida/EnviarBuscarPartida.dart';
import 'package:tfg_ginyote/domain/partida/VerMano.dart';
import 'package:tfg_ginyote/domain/partida/VerTriunfoResponse.dart';
import 'package:tfg_ginyote/use-cases/partida/JugarManoUseCase.dart';
import '../../domain/partida/CambiarTriunfo.dart';
import '../../domain/partida/CartaJugadaRival.dart';
import '../../domain/partida/CartaJugadaRivalResponse.dart';
import '../../domain/partida/ComprobarRonda.dart';
import '../../domain/partida/JugarCarta.dart';
import '../../domain/partida/JugarCartaResponse.dart';
import '../../domain/partida/VerGlobal.dart';
import '../../domain/partida/VerManoResponse.dart';
import '../../domain/partida/VerTriunfo.dart';
import '../../use-cases/partida/BuscarPartidaUserCase.dart';
import '../../use-cases/partida/CambiarTriunfoUseCase.dart';
import '../../use-cases/partida/Cantar20UseCase.dart';
import '../../use-cases/partida/Cantar40UseCase.dart';
import '../../use-cases/partida/CartaJugadaRivalUseCase.dart';
import '../../use-cases/partida/ComprobarGanadorUseCase.dart';
import '../../use-cases/partida/SiguienteJugadorUseCase.dart';
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
  JugarManoUseCase? _jugarManoUseCase;
  SiguienteJugadorUseCase? _siguienteJugadorUseCase;
  Cantar20UseCase? _cantar20UseCase;
  Cantar40UseCase? _cantar40UseCase;
  CartaJugadaRivalUseCase? _cartaJugadaRivalUseCase;
  ComprobarGanadorUseCase? _comprobarGanadorUseCase;
  CambiarTriunfoUseCase? _cambiarTriunfoUseCase;

  PartidaBloc(
      this._buscarPartidaUserCase,
      this._verManoUserCasa,
      this._verTriunfoUserCase,
      this._verGlobalUserCase,
      this._siguienteJugadorUseCase,
      this._jugarManoUseCase,
      this._cantar20UseCase,
      this._cantar40UseCase,
      this._cartaJugadaRivalUseCase,
      this._comprobarGanadorUseCase,
      this._cambiarTriunfoUseCase,
    ) : super(UserInitial()) {
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
    on<ObtenerSiguienteJugadorEvent>((event, emit) async{
      final response = await _siguienteJugadorUseCase!.postSiguienteJugador(event.idPartida);
      if (response!.success) {
        emit(SiguienteJugadorLoadedState(siguienteJugador: '${response.siguienteJugador}'));
      }else{
        // emit(BuscadorLoadingState(response));
      }
    });
    on<JugarCartaEvent>((event, emit) async {
      emit(EsperandoRespuestaState());

      final response = await _jugarManoUseCase!.postJugarCarta(event.cartaJugada);

      if (response!.success) {
        emit(JugarCartaLoadedState(response));

        if (response.infoGanador.informacionCoto.success) {
          await Future.delayed(Duration(seconds: 2));
          if (!emit.isDone) {
            emit(GanadorCotoState(response.infoGanador.informacionCoto));
          }
        }
      } else {
        emit(JugarCartaLoadingState(response));
      }
    });

    on<CartaJugadaRivalEvent>((event, emit) async{
      final response = await _cartaJugadaRivalUseCase!.postVerCartaJugadaRival(event.BuscarCarta);
      if (response!.success) {
        emit(CartaJugadaRivalLoadedState(response));
      }else{
        emit(CartaJugadaRivalLoadingState(response));
      }
    });

    on<ComprobarGanadorEvent>((event, emit) async{
      final response = await _comprobarGanadorUseCase!.postComprobarRonda(event.comprobarRonda);

      if (response!.success) {
        emit(ComprobarGanadorLoadedState(haGanado: true, ganador: "${response.ganador}"));
      }else{
        emit(ComprobarGanadorLoadedState(haGanado: false));
      }
    });

    on<CambiarTriunfoEvent>((event, emit) async {
      final response = await _cambiarTriunfoUseCase!.postCambiarTriunfo(event.comprobarRonda);

      if (response != null && response.success) {
        emit(CambiarTriunfoLoadedState(response));
      } else {
        emit(CambiarTriunfoErrorState(mensaje: 'Error al cambiar triunfo'));
      }
    });

  }
}

