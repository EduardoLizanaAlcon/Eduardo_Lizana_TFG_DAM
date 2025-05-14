import "dart:convert";

import "package:tfg_ginyote/bloc/partida/partida_bloc.dart";
import "package:tfg_ginyote/domain/partida/VerGlobal.dart";
import "package:tfg_ginyote/domain/partida/VerGlobalResponse.dart";

import "../../domain/partida/BuscarpartidaResponse.dart";
import "../../domain/partida/EnviarBuscarPartida.dart";
import "../../domain/partida/VerMano.dart";
import "../../domain/partida/VerManoResponse.dart";
import "../../util/Entorno.dart";
import "../api-client-interfaz.dart";

class PartidaService {
  final ApiClient apiClient;
  PartidaService(this.apiClient);
  Future<BuscarpartidaResponse?> postBuscarPartida(BuscarPartida buscador) async {
    try{
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',

      };
      print(Entorno().getEntorno());
      final response = await apiClient.post('${Entorno().getEntorno()}PartidaControlador/ObtenerJugadores',  headers, buscarPartidaToJson(buscador));
      final l = buscarpartidaResponseFromJson(response);
      return l;

    }catch(e){
      return null;
    }
  }
  Future<VerManoResponse?> postVerMano(VerMano mano) async {
    try{
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      final response = await apiClient.post('${Entorno().getEntorno()}PartidaControlador/MirarCartas',  headers, verManoToJson(mano));
      print("object");
      final l = verManoResponseFromJson(response);
      return l;

    }catch(e){
      // VerManoResponse hr = verManoResponseFromJson(success: false);
      return null;
    }
  }
  Future<VerGlobalResponse?> postVerGlobal(VerGlobal global) async {
    try{
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      final response = await apiClient.post('${Entorno().getEntorno()}PartidaControlador/ObtenerJugadores',  headers, VerGlobalToJson(global));
      final l = verGlobalResponseFromJson(response);
      return l;

    }catch(e){
      // BuscarpartidaResponse hr = BuscarpartidaResponse(success: false);
      return null;
    }
  }
  Future<VerManoResponse?> postVerTriunfo(VerMano triunfo) async {
    try{
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      final response = await apiClient.post('${Entorno().getEntorno()}/PartidaControlador/MirarCartas',  headers,  verManoToJson(triunfo));
      print("a");
      final l = verManoResponseFromJson(response);
      return l;

    }catch(e){
      return null;
    }
  }
}