import '../../data/partida/PartidaRepository.dart';
import '../../domain/partida/BuscarpartidaResponse.dart';
import '../../domain/partida/EnviarBuscarPartida.dart';

class BuscarPartidaUserCase{
  PartidaRepository _partidaRepository;
  BuscarPartidaUserCase(this._partidaRepository);
  Future<BuscarpartidaResponse?> postBuscarPartida(BuscarPartida buscador) async{
    final response = await _partidaRepository.postBuscarPartida(buscador);
    return response;
  }
}