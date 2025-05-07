import 'dart:convert';

import 'package:http/http.dart' as http;
import 'api-client-interfaz.dart';

class HttpApiClient implements ApiClient {
  final http.Client client;

  HttpApiClient(this.client);

  @override
  Future<String> get(String url, Map<String, String> headers) async {
    final response = await client.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      String decodedBody = utf8.decode(response.bodyBytes);
      return decodedBody;
    } else {
      throw Exception("Error al obtener datos");
    }
  }

  @override
  Future<String> post(String url, Map<String, String> headers, String body) async {
    final response = await client.post(Uri.parse(url), headers: headers, body: body);

    String decodedBody = utf8.decode(response.bodyBytes);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return decodedBody;
    } else {
      try {
        final Map<String, dynamic> jsonResponse = json.decode(decodedBody);

        if (!jsonResponse.containsKey('success')) {
          jsonResponse['success'] = false;
          decodedBody = json.encode(jsonResponse);
        }
      } catch (e) {
        final Map<String, dynamic> errorResponse = {
          'success': false,
          'error': decodedBody,
        };
        decodedBody = json.encode(errorResponse);
      }

      return decodedBody;
    }
  }

  @override
  Future<String> put(String url, Map<String, String> headers, String body) async{
    final response = await client.put(Uri.parse(url), headers: headers, body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      String decodedBody = utf8.decode(response.bodyBytes);
      return decodedBody;
    } else {
      throw Exception("Error al obtener datos");
    }
    throw UnimplementedError();
  }

  @override
  Future<String> delete(String url, Map<String, String> headers, String body) async{
    final response = await client.delete(Uri.parse(url), headers: headers, body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      String decodedBody = utf8.decode(response.bodyBytes);
      return decodedBody;
    } else {
      throw Exception("Error al obtener datos");
    }
    throw UnimplementedError();
  }
}