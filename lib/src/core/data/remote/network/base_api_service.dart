abstract class BaseApiServices {
  Future<dynamic> getResponse(String url);

  Future<dynamic> postResponse(
    String url, {
    required Map<String, dynamic> data,
  });

  Future<dynamic> putResponse(
    String url, {
    required Map<String, dynamic> data,
    int? id,
  });

  Future<dynamic> deleteResponse(String url);

  Future<dynamic> uploadImage(
    String url, {
    required String fileResult,
  });
}
