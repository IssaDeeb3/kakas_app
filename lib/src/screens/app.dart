import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kakas_app/src/core/data/local/local_keys.dart';
import 'package:kakas_app/src/screens/auth/view/login_screen/login_screen.dart';
import 'package:kakas_app/src/screens/products/view/product_screen/products_screen.dart';
import 'package:kakas_app/src/screens/shared/base_multi_provider/base_multi_provider.dart';

import '../core/resources/theme/theme_manager.dart';

class BaseApp extends StatefulWidget {
  const BaseApp({super.key});

  @override
  State<BaseApp> createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenUtil.init(context);
  }

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = GetStorage().hasData(LocalKeys.token);

    return BaseMultiProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        theme: AppTheme.lightTheme(context),
        home: isLoggedIn ? const ProductsScreen() : const LoginScreen(),
      ),
    );
  }
}
