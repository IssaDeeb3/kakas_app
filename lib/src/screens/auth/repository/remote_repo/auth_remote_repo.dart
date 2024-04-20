import 'dart:async';

import 'package:get_storage/get_storage.dart';
import 'package:kakas_app/src/core/data/local/local_keys.dart';
import 'package:kakas_app/src/core/utils/logger.dart';

import '../../../../core/data/remote/app_exception.dart';
import '../../../../core/data/remote/network/base_api_service.dart';
import '../../../../core/data/remote/response/api_end_points.dart';
import '../../model/user_model.dart';

class AuthRepository {
  final BaseApiServices networkApiServices;

  AuthRepository({required this.networkApiServices});

  final getStorage = GetStorage();

  //! Register User =================================
  Future<bool> registerUser(MainUserModel user) async {
    try {
      final response = await networkApiServices
          .postResponse(ApiEndPoints.register, data: user.toJson());

      final token = response['token'];

      Log.w('saveToken ============== $token');

      await saveUserJwt(token);

      return true;
    } on FetchDataException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

  //! Login User =================================
  Future<bool> login(MainUserModel user) async {
    try {
      final response = await networkApiServices.postResponse(ApiEndPoints.login,
          data: user.toJson());

      final token = response['token'];
      Log.w('saveToken ============== $token');

      await saveUserJwt(token);

      return true;
    } on FetchDataException {
      return false;
    } on TimeoutException {
      return false;
    }
  }

  Future<void> saveUserJwt(String token) async {
    try {
      await getStorage.write(LocalKeys.token, token);
    } catch (e) {
      Log.e('Error =============== ${e.toString()}');
    }
  }
}
