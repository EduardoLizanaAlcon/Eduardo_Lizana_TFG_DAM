import 'package:tfg_ginyote/domain/partida/CambiarTriunfo.dart';
import 'package:tfg_ginyote/domain/partida/VerTriunfo.dart';
import 'package:tfg_ginyote/domain/partida/VerTriunfoResponse.dart';

import '../../data/partida/PartidaRepository.dart';
import '../../domain/partida/CambiarTriunfoResponse.dart';
import '../../domain/partida/JugarCarta.dart';
import '../../domain/partida/JugarCartaResponse.dart';
import '../../domain/partida/VerMano.dart';
import '../../domain/partida/VerManoResponse.dart';

class CambiarTriunfoUseCase{
  PartidaRepository _partidaRepository;
  CambiarTriunfoUseCase(this._partidaRepository);
  Future<CambiarTriunfoResponse?> postCambiarTriunfo(CambiarTriunfo cambTriunfo) async{
    final response = await _partidaRepository.postCambiarTriunfo(cambTriunfo);
    return response;
  }
}