import 'package:tfg_ginyote/domain/partida/VerTriunfo.dart';
import 'package:tfg_ginyote/domain/partida/VerTriunfoResponse.dart';

import '../../data/partida/PartidaRepository.dart';
import '../../domain/partida/VerMano.dart';
import '../../domain/partida/VerManoResponse.dart';

class VerTriunfoUserCase{
  PartidaRepository _partidaRepository;
  VerTriunfoUserCase(this._partidaRepository);
  Future<VerTriunfoResponse?> postVerTriunfo(VerTriunfo triunfo) async{
    final response = await _partidaRepository.postVerTriunfo(triunfo);
    return response;
  }
}