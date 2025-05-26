import 'package:tfg_ginyote/domain/partida/CartaJugadaRivalResponse.dart';
import 'package:tfg_ginyote/domain/partida/ComprobarRonda.dart';
import '../../data/partida/PartidaRepository.dart';
import '../../domain/partida/CartaJugadaRival.dart';
import '../../domain/partida/ComprobarRondaResponse.dart';

class ComprobarGanadorUseCase{
  PartidaRepository _partidaRepository;
  ComprobarGanadorUseCase(this._partidaRepository);
  Future<ComprobarRondaResponse?> postComprobarRonda(ComprobarRonda compRonda) async{
    final response = await _partidaRepository.PostComprobarRonda(compRonda);
    return response;
  }
}