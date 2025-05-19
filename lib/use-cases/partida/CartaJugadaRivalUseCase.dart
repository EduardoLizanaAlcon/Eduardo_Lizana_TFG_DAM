import 'package:tfg_ginyote/domain/partida/CartaJugadaRival.dart';
import '../../data/partida/PartidaRepository.dart';
import '../../domain/partida/CartaJugadaRivalResponse.dart';

class CartaJugadaRivalUseCase{

  PartidaRepository _partidaRepository;
  CartaJugadaRivalUseCase(this._partidaRepository);
  Future<CartaJugadaRivalResponse?> postVerCartaJugadaRival(CartaJugadaRival cartaRivalJugada) async{
    final response = await _partidaRepository.VerCartaJugadaRival(cartaRivalJugada);
    return response;
  }
}