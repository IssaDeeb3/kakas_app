import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../utils/logger.dart';
import '../../local/local_keys.dart';
import '../app_exception.dart';
import '../response/api_end_points.dart';
import 'base_api_service.dart';

class NetworkApiService extends BaseApiServices {
  final _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    if (GetStorage().hasData(LocalKeys.token))
      'Authorization': 'Bearer ${GetStorage().read(LocalKeys.token)}',
  };

  //! Get request
  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final endpoint = ApiEndPoints.baseUrl + url;

      Log.i('apiUrl => $endpoint');

      final response = await http.get(
        Uri.parse(endpoint),
        headers: _headers,
      );

      Log.i('URL -> $endpoint\n 💾💾💾 GetResponse -> ${response.body} 💾💾💾');

      responseJson = returnResponse(response);
    } on SocketException {
      rethrow;
    } catch (e) {
      throw FetchDataException(
          "FetchDataException: getResponse ${e.toString()}");
    }
    return responseJson;
  }

  // ! Post request
  @override
  Future postResponse(
    String url, {
    required Map<String, dynamic> data,
    List<String>? fileResult,
  }) async {
    dynamic responseJson;
    final apiUrl = Uri.parse(ApiEndPoints.baseUrl + url);

    Log.w('PostApiUrl => $apiUrl\n 💾💾💾 PostResponse -> $data 💾💾💾');

    final response = await http.post(
      apiUrl,
      body: jsonEncode(data),
      headers: _headers,
    );

    Log.w('Res => ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      responseJson = await jsonDecode(response.body);

      return responseJson;
    } else {
      throw FetchDataException(
          'Error occurred while communication with server: ${response.body} with status code : ${response.statusCode}');
    }
  }

  // ! Post request
  @override
  Future putResponse(
    String url, {
    required Map<String, dynamic> data,
    List<String>? fileResult,
    int? id,
  }) async {
    dynamic responseJson;
    final apiUrl = Uri.parse(ApiEndPoints.baseUrl + url);

    Log.w('Put => $apiUrl\n 💾💾💾 PutResponse -> $data 💾💾💾');

    final response = await http.put(
      apiUrl,
      body: jsonEncode(data),
      headers: _headers,
    );

    Log.w('Res => ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      responseJson = await jsonDecode(response.body);

      return responseJson;
    } else {
      throw FetchDataException(
          'Error occurred while communication with server: ${response.body} with status code : ${response.statusCode}');
    }
  }

  @override
  Future uploadImage(String url, {required String fileResult}) async {
    var data = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        fileResult,
      )
    });

    var dio = Dio();
    var response = await dio.request(
      url,
      options: Options(
        method: 'POST',
        headers: _headers,
      ),
      data: data,
    );

    Log.i('UploadImage => URL: $url\nBody: ${response.data}');

    return response.data;
  }

  @override
  Future deleteResponse(String url) async {
    try {
      final apiUrl = Uri.parse(ApiEndPoints.baseUrl + url);

      return await http.delete(apiUrl, headers: _headers).then((value) {
        Log.e('DeleteResponse => URL: $apiUrl\nBody: ${value.body}');
        return value.body;
      });
    } on SocketException {
      rethrow;
    } on TimeoutException {
      rethrow;
    } catch (e) {
      throw FetchDataException(
          "FetchDataException: getResponse ${e.toString()}");
    }
  }

//! Response handler
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body.toString());
      case 400:
        throw FetchDataException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server: ${response.body} with status code : ${response.statusCode}');
    }
  }
}
