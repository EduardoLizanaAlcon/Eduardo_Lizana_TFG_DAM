abstract class ApiClient {
  Future<String> get(String url, Map<String, String> headers);
  Future<String> post(String url, Map<String, String> headers, String body);
  Future<String> put(String url, Map<String, String> headers, String body);
  Future<String> delete(String url, Map<String, String> headers, String body);
}