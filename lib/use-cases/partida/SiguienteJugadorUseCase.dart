import 'package:tfg_ginyote/domain/partida/VerTriunfo.dart';
import 'package:tfg_ginyote/domain/partida/VerTriunfoResponse.dart';

import '../../data/partida/PartidaRepository.dart';
import '../../domain/partida/JugarCarta.dart';
import '../../domain/partida/JugarCartaResponse.dart';
import '../../domain/partida/SiguienteJugadorResponse.dart';
import '../../domain/partida/VerMano.dart';
import '../../domain/partida/VerManoResponse.dart';

class SiguienteJugadorUseCase{
  PartidaRepository _partidaRepository;
  SiguienteJugadorUseCase(this._partidaRepository);
  Future<SiguienteJugadorResponse?> postSiguienteJugador(String idPartida) async{
    final response = await _partidaRepository.obtenerSiguienteJugador(idPartida);
    return response;
  }
}