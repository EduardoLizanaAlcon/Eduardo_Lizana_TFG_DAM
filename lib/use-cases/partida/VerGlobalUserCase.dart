import 'package:tfg_ginyote/domain/partida/VerGlobal.dart';

import '../../data/partida/PartidaRepository.dart';
import '../../domain/partida/BuscarpartidaResponse.dart';
import '../../domain/partida/EnviarBuscarPartida.dart';

class VerGlobalUserCase{
  PartidaRepository _partidaRepository;
  VerGlobalUserCase(this._partidaRepository);
  Future<BuscarpartidaResponse?> postVerGlobal(VerGlobal global) async{
    // final response = await _partidaRepository.postVerGlobal(global);
    return null;
  }
}