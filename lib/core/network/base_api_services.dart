abstract class BaseApiServices {
  Future<dynamic> getApi(String url);
  Future<dynamic> postApi(String url,
      {Map<String, String>? headers, var body});

}
