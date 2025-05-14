
import 'package:tfg_ginyote/domain/historial/EnviarAHIstorial.dart';
import 'package:tfg_ginyote/domain/historial/HistorialResponse.dart';

import '../../domain/user/Login.dart';
import '../../domain/user/User.dart';

class Historicorepository {
  final _HistoricoService;
  Historicorepository(this._HistoricoService);
  Future<HistorialResponse?> postObtenerHistorico(Historial historico) async =>  await _HistoricoService.postObtenerHistorial(historico);
}