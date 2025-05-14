import "package:tfg_ginyote/util/UsuarioDatos.dart";

import "../../domain/historial/EnviarAHIstorial.dart";
import "../../domain/historial/HistorialResponse.dart";
import "../../domain/user/Login.dart";
import "../../domain/user/User.dart";
import "../../util/Entorno.dart";
import "../api-client-interfaz.dart";

class HistoricoService {
  final ApiClient apiClient;
  HistoricoService(this.apiClient);
  Future<HistorialResponse?> postObtenerHistorial(Historial historico) async {
    try{
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',

      };
      final response = await apiClient.post('${Entorno().getEntorno()}UserControlador/ObtenerRegistroUsuario',  headers, historialToJson(historico));
      final l = historialResponseFromJson(response);
      return l;

    }catch(e){
      HistorialResponse hr = HistorialResponse(success: false, mensaje: 'Ha habido un error en la comunicación', partidas: []);
      return hr;
    }
  }
}