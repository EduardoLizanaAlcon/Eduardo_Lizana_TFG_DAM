import 'package:tfg_ginyote/domain/partida/CartaJugadaRivalResponse.dart';
import '../../data/partida/PartidaRepository.dart';
import '../../domain/partida/CartaJugadaRival.dart';

class ComprobarGanadorUseCase{
  PartidaRepository _partidaRepository;
  ComprobarGanadorUseCase(this._partidaRepository);
  Future<CartaJugadaRivalResponse?> postComprobarRonda(CartaJugadaRival carJuga) async{
    final response = await _partidaRepository.ComprobarRonda(carJuga);
    return response;
  }
}