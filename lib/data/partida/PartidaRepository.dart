import 'package:tfg_ginyote/domain/historial/EnviarAHIstorial.dart';
import 'package:tfg_ginyote/domain/partida/ComprobarRonda.dart';
import 'package:tfg_ginyote/domain/partida/JugarCarta.dart';
import 'package:tfg_ginyote/domain/partida/VerGlobal.dart';
import 'package:tfg_ginyote/domain/partida/VerMano.dart';
import 'package:tfg_ginyote/domain/partida/VerTriunfo.dart';
import 'package:tfg_ginyote/domain/partida/VerTriunfoResponse.dart';
import '../../domain/partida/BuscarpartidaResponse.dart';
import '../../domain/partida/CartaJugadaRival.dart';
import '../../domain/partida/CartaJugadaRivalResponse.dart';
import '../../domain/partida/ComprobarRonda.dart';
import '../../domain/partida/ComprobarRonda.dart';
import '../../domain/partida/ComprobarRondaResponse.dart';
import '../../domain/partida/EnviarBuscarPartida.dart';
import '../../domain/partida/JugarCartaResponse.dart';
import '../../domain/partida/SiguienteJugadorResponse.dart';
import '../../domain/partida/VerManoResponse.dart';


class PartidaRepository {
  final _PartidaService;
  PartidaRepository(this._PartidaService);
  Future<BuscarpartidaResponse?> postBuscarPartida(BuscarPartida buscador) async =>  await _PartidaService.postBuscarPartida(buscador);
  Future<VerTriunfoResponse?> postVerTriunfo(VerTriunfo triunfo) async =>  await _PartidaService.postVerTriunfo(triunfo);
  Future<VerManoResponse?> postVerMano(VerMano mano) async =>  await _PartidaService.postVerMano(mano);
  Future<SiguienteJugadorResponse?> obtenerSiguienteJugador(String idPartida) async => await _PartidaService.obtenerSiguienteJugador(idPartida);
  Future<JugarCartaResponse?> jugarCarta(JugarCarta cartJugada ) async => await _PartidaService.jugarCarta(cartJugada);
  Future<CartaJugadaRivalResponse?> VerCartaJugadaRival(CartaJugadaRival cartrivJugada) async => await _PartidaService.postVerCartaJugadaRival(cartrivJugada);
  Future<ComprobarRondaResponse?> PostComprobarRonda(ComprobarRonda compRonda) async => await _PartidaService.postComprobarRondaService(compRonda);

  // Future<Map<String, dynamic>?> cantar20({
  //   required String idPartida,
  //   required String idJugador,
  // }) async =>
  //     await _PartidaService.cantar20(
  //       idPartida: idPartida,
  //       idJugador: idJugador,
  //     );
  //
  // Future<Map<String, dynamic>?> cantar40({
  //   required String idPartida,
  //   required String idJugador,
  // }) async =>
  //     await _PartidaService.cantar40(
  //       idPartida: idPartida,
  //       idJugador: idJugador,
  //     );
}