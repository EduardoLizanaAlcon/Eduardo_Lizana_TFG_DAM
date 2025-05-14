import 'package:tfg_ginyote/domain/partida/VerMano.dart';

import '../../data/partida/PartidaRepository.dart';
import '../../domain/partida/BuscarpartidaResponse.dart';
import '../../domain/partida/VerManoResponse.dart';

class VerManoUserCase{
  PartidaRepository _partidaRepository;
  VerManoUserCase(this._partidaRepository);
  Future<VerManoResponse?> postVerMano(VerMano mano) async{
    final response = await _partidaRepository.postVerMano(mano);
    return response;
  }
}