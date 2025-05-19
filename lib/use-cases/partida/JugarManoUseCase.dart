import 'package:tfg_ginyote/domain/partida/VerTriunfo.dart';
import 'package:tfg_ginyote/domain/partida/VerTriunfoResponse.dart';

import '../../data/partida/PartidaRepository.dart';
import '../../domain/partida/JugarCarta.dart';
import '../../domain/partida/JugarCartaResponse.dart';
import '../../domain/partida/VerMano.dart';
import '../../domain/partida/VerManoResponse.dart';

class JugarManoUseCase{
  PartidaRepository _partidaRepository;
  JugarManoUseCase(this._partidaRepository);
  Future<JugarCartaResponse?> postJugarCarta(JugarCarta carJuga) async{
    final response = await _partidaRepository.jugarCarta(carJuga);
    return response;
  }
}