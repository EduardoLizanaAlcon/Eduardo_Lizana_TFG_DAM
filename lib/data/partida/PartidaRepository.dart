import 'package:tfg_ginyote/domain/historial/EnviarAHIstorial.dart';
import 'package:tfg_ginyote/domain/partida/VerGlobal.dart';
import 'package:tfg_ginyote/domain/partida/VerMano.dart';
import 'package:tfg_ginyote/domain/partida/VerTriunfo.dart';
import 'package:tfg_ginyote/domain/partida/VerTriunfoResponse.dart';
import '../../domain/partida/BuscarpartidaResponse.dart';
import '../../domain/partida/EnviarBuscarPartida.dart';
import '../../domain/partida/VerManoResponse.dart';


class PartidaRepository {
  final _PartidaService;
  PartidaRepository(this._PartidaService);
  Future<BuscarpartidaResponse?> postBuscarPartida(BuscarPartida buscador) async =>  await _PartidaService.postBuscarPartida(buscador);
  Future<VerTriunfoResponse?> postVerTriunfo(VerTriunfo triunfo) async =>  await _PartidaService.postVerTriunfo(triunfo);
  Future<VerManoResponse?> postVerMano(VerMano mano) async =>  await _PartidaService.postVerMano(mano);
  Future<BuscarpartidaResponse?> postVerGlobal(VerGlobal global) async =>  await _PartidaService.postVerGlobal(global);
}