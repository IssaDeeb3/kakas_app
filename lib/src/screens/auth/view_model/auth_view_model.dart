import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kakas_app/src/core/data/local/local_keys.dart';
import 'package:kakas_app/src/core/extensions/extensions.dart';
import 'package:kakas_app/src/screens/auth/view/login_screen/login_screen.dart';
import 'package:kakas_app/src/screens/products/view/product_screen/products_screen.dart';

import '../../../core/data/remote/app_exception.dart';
import '../../../core/data/remote/response/api_strings.dart';
import '../../../core/utils/logger.dart';
import '../model/user_model.dart';
import '../repository/remote_repo/auth_remote_repo.dart';

class AuthVM extends ChangeNotifier {
  final AuthRepository authRepository;

  AuthVM({required this.authRepository});

  bool _isLoading = false;
  bool isObscure = true;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //! Register User ================================
  Future<void> registerUser(
    BuildContext context, {
    required Map<String, TextEditingController> controllers,
  }) async {
    try {
      isLoading = true;
      final userModel = MainUserModel(
        userName: controllers[ApiStrings.username]!.text,
        password: controllers[ApiStrings.password]!.text,
      );

      final registered = await authRepository.registerUser(userModel);

      if (registered) {
        isLoading = false;

        if (!context.mounted) return;

        context.toReplacement(const ProductsScreen());

        context.showBarMessage(
          'Signed Up Successfully',
        );
      } else {
        isLoading = false;

        _authErrorBar(context);
      }
    } on FetchDataException {
      isLoading = false;

      _authErrorBar(context);
    } catch (e) {
      isLoading = false;

      _authErrorBar(context);
    }
  }

  //! Login ================================
  Future<void> login(
    BuildContext context, {
    required Map<String, TextEditingController> controllers,
  }) async {
    try {
      isLoading = true;
      final userModel = MainUserModel(
        userName: controllers[ApiStrings.username]!.text,
        password: controllers[ApiStrings.password]!.text,
      );

      final isLoggedIn = await authRepository.login(userModel);

      if (!context.mounted) return;
      if (isLoggedIn) {
        context.toReplacement(const ProductsScreen());

        context.showBarMessage(
          'Login Successfully',
        );
      } else {
        context.showBarMessage('Please Check Your Username And Password',
            isError: true);
      }
      isLoading = false;
    } on FetchDataException catch (e) {
      Log.e('Fetch Data Exception ${e.toString()}');
      isLoading = false;
    }
  }

  MainUserModel? _userModel;

  bool get isLoggedIn => _userModel != MainUserModel.empty();

  void isObscurePassword() {
    isObscure = !isObscure;
    notifyListeners();
  }

  //! Logout
  void logout(BuildContext context) {
    GetStorage().remove(LocalKeys.token);
    context.toReplacement(const LoginScreen());
  }

  void _authErrorBar(BuildContext context) {
    context.showBarMessage('Email Or User name Are Already Taken',
        isError: true);
  }
}
