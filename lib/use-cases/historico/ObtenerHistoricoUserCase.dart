import 'package:tfg_ginyote/domain/historial/EnviarAHIstorial.dart';
import 'package:tfg_ginyote/domain/historial/HistorialResponse.dart';
import '../../data/historial/HistoricoRepository.dart';

class ObtenerHistoricoUserCase{
  Historicorepository _repositoryHistoial;
  ObtenerHistoricoUserCase(this._repositoryHistoial);
  Future<HistorialResponse?> postObtenerHistorico(Historial historico) async{
    final response = await _repositoryHistoial.postObtenerHistorico(historico);
    return response;
  }
}