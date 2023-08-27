abstract class BaseApi {
  Future<dynamic> getApi(String url);
  Future<dynamic> getApiBody(String url, int id, String role);
  Future<dynamic> postApi(String url, dynamic data);
  Future<dynamic> putApi(String url, dynamic data);
  Future<dynamic> deleteApi(String url);
}
