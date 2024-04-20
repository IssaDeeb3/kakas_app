import 'package:flutter/material.dart';
import 'package:kakas_app/src/core/data/remote/network/network_api_service.dart';
import 'package:kakas_app/src/screens/auth/repository/remote_repo/auth_remote_repo.dart';
import 'package:kakas_app/src/screens/products/repository/product_repository.dart';
import 'package:kakas_app/src/screens/products/view_model/product_view_model.dart';
import 'package:kakas_app/src/screens/shared/media/view_models/media_view_model.dart';
import 'package:provider/provider.dart';

import '../../auth/view_model/auth_view_model.dart';

class BaseMultiProvider extends StatelessWidget {
  final Widget child;

  const BaseMultiProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => AuthVM(
                  authRepository:
                      AuthRepository(networkApiServices: NetworkApiService()),
                )),
        ChangeNotifierProvider(
            create: (context) => ProductsVM(
                  productRepo: ProductRepository(
                      networkApiServices: NetworkApiService()),
                )),
        ChangeNotifierProvider(create: (context) => MediaVM()),
      ],
      child: child,
    );
  }
}
