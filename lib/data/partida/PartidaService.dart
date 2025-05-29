import "dart:convert";

import "package:tfg_ginyote/domain/partida/CartaJugadaRival.dart";
import "package:tfg_ginyote/domain/partida/JugarCarta.dart";
import "package:tfg_ginyote/domain/partida/VerGlobal.dart";
import "package:tfg_ginyote/domain/partida/VerGlobalResponse.dart";
import "package:tfg_ginyote/domain/partida/VerTriunfo.dart";
import "package:tfg_ginyote/domain/partida/VerTriunfoResponse.dart";

import "../../domain/partida/BuscarpartidaResponse.dart";
import "../../domain/partida/CambiarTriunfo.dart";
import "../../domain/partida/CambiarTriunfoResponse.dart";
import "../../domain/partida/CartaJugadaRivalResponse.dart";
import "../../domain/partida/ComprobarRonda.dart";
import "../../domain/partida/ComprobarRondaResponse.dart";
import "../../domain/partida/EnviarBuscarPartida.dart";
import "../../domain/partida/JugarCartaResponse.dart";
import "../../domain/partida/SiguienteJugadorResponse.dart";
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
      final response = await apiClient.post('${Entorno().getEntorno()}PartidaControlador/ObtenerJugadores',  headers, buscarPartidaToJson(buscador));
      final l = buscarpartidaResponseFromJson(response);
      return l;

    }catch(e){
      String response = '{"success":false}';
      return buscarpartidaResponseFromJson(response);
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
      String response = '{"success":false}';
      verManoResponseFromJson(response);
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
      String response = '{"success":false}';
      return verGlobalResponseFromJson(response);
    }
  }
  Future<VerTriunfoResponse?> postVerTriunfo(VerTriunfo triunfo) async {
    try{
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      final response = await apiClient.post('${Entorno().getEntorno()}PartidaControlador/MirarCartas',  headers,  verTriunfoToJson(triunfo));
      print("a");
      final l = verTriunfoResponseFromJson(response);
      return l;

    }catch(e){
      String response = '{"success":false}';
      return verTriunfoResponseFromJson(response);
    }
  }
  Future<CartaJugadaRivalResponse?> postVerCartaJugadaRival(CartaJugadaRival CartaRivalJugada) async {
    try{
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      final response = await apiClient.post('${Entorno().getEntorno()}PartidaControlador/verCartaRival',  headers,  cartaJugadaRivalToJson(CartaRivalJugada));
      final l = cartaJugadaRivalResponseFromJson(response);
      return l;

    }catch(e){
      String response = '{"success":false}';
      return cartaJugadaRivalResponseFromJson(response);
    }
  }
  Future<SiguienteJugadorResponse?> obtenerSiguienteJugador(String idPartida) async {
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      final body = json.encode({'id_partida': idPartida});
      final response = await apiClient.post(
        '${Entorno().getEntorno()}PartidaControlador/ObtenerSiguienteJugador',
        headers,
        body,
      );
      return siguienteJugadorResponseFromJson(response);
    } catch (e) {
      print('Error al obtener siguiente jugador: $e');
      String response = '{"success":false}';
      return siguienteJugadorResponseFromJson(response);
    }
  }
  Future<JugarCartaResponse?> jugarCarta(
      JugarCarta cartaJugada
      ) async {
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      final response = await apiClient.post(
        '${Entorno().getEntorno()}PartidaControlador/JugarCarta',
        headers,
        jugarCartaToJson(cartaJugada),
      );
      return jugarCartaResponseFromJson(response);
    } catch (e) {
      String response = '{"success":false}';
      return jugarCartaResponseFromJson(response);
    }
  }
  Future<ComprobarRondaResponse?> postComprobarRondaService(
      ComprobarRonda compRonda
      ) async {
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      final response = await apiClient.post(
        '${Entorno().getEntorno()}PartidaControlador/ObtenerGanador',
        headers,
        comprobarRondaToJson(compRonda),
      );
      return comprobarRondaResponseFromJson(response);
    } catch (e) {
      String response = '{"success":false}';
      return comprobarRondaResponseFromJson(response);
    }
  }
  Future<CambiarTriunfoResponse?> postCambiarTriunfoService(
      CambiarTriunfo compTriunfo
      ) async {
    try {
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
      final response = await apiClient.post(
        '${Entorno().getEntorno()}PartidaControlador/CambiarCartaTriunfo',
        headers,
        cambiarTriunfoToJson(compTriunfo),
      );
      return cambiarTriunfoResponseFromJson(response);
    } catch (e) {
      String response = '{"success":false}';
      return cambiarTriunfoResponseFromJson(response);
    }
  }

  // Future<Map<String, dynamic>?> cantar20({
  //   required String idPartida,
  //   required String idJugador,
  // }) async {
  //   try {
  //     final headers = {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //     };
  //     final body = jsonEncode({
  //       'id_partida': idPartida,
  //       'id_jugador': idJugador,
  //     });
  //     final response = await apiClient.post(
  //       '${Entorno().getEntorno()}PartidaControlador/Cantar20',
  //       headers,
  //       body,
  //     );
  //     return jsonDecode(response);
  //   } catch (e) {
  //     print('Error al cantar 20: $e');
  //     return null;
  //   }
  // }
  //
  // Future<Map<String, dynamic>?> cantar40({
  //   required String idPartida,
  //   required String idJugador,
  // }) async {
  //   try {
  //     final headers = {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //     };
  //     final body = jsonEncode({
  //       'id_partida': idPartida,
  //       'id_jugador': idJugador,
  //     });
  //     final response = await apiClient.post(
  //       '${Entorno().getEntorno()}PartidaControlador/Cantar40',
  //       headers,
  //       body,
  //     );
  //     return jsonDecode(response);
  //   } catch (e) {
  //     print('Error al cantar 40: $e');
  //     return null;
  //   }
  // }
}