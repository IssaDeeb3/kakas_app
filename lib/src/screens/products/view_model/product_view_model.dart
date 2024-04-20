import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:kakas_app/src/core/data/remote/app_exception.dart';
import 'package:kakas_app/src/core/data/remote/response/api_strings.dart';
import 'package:kakas_app/src/core/extensions/extensions.dart';
import 'package:kakas_app/src/core/utils/logger.dart';
import 'package:kakas_app/src/screens/products/model/product_model.dart';
import 'package:kakas_app/src/screens/products/repository/product_repository.dart';
import 'package:kakas_app/src/screens/shared/loading_view_model/loading_view_model.dart';

class ProductsVM extends LoadingVM {
  final ProductRepository productRepo;

  ProductsVM({required this.productRepo});

  List<ProductModel> products = [];
  List searchedProductsList = [];

  //! Get Products ===================================
  Future<void> getProducts() async {
    try {
      isLoading = true;
      products = await productRepo.getProducts();
      isLoading = false;
    } on FetchDataException catch (e) {
      Log.e('Fetch Data Exception ${e.toString()}');
      isLoading = false;
    } on SocketException {
      isLoading = false;
    } on TimeoutException {
      isLoading = false;
    }
  }

  //! Add Products ===================================
  Future<void> addProduct(
    BuildContext context, {
    required Map<String, TextEditingController> controllers,
    required String pickedImage,
  }) async {
    try {
      isLoading = true;

      final product = ProductModel(
        title: controllers[ApiStrings.title]!.text,
        description: controllers[ApiStrings.description]!.text,
        price: num.tryParse(controllers[ApiStrings.price]!.text),
      );

      await productRepo.addProduct(product: product, pickedImage: pickedImage);

      getProducts();

      if (context.mounted) {
        context.back();
        context.showBarMessage('Product Added Successfully');
      }
      isLoading = false;
    } on FetchDataException catch (e) {
      Log.e('Fetch Data Exception ${e.toString()}');
      isLoading = false;
    } on SocketException {
      isLoading = false;
    } on TimeoutException {
      isLoading = false;
    }
  }

  //! Edit Product ===================================
  Future<void> editProduct(
    BuildContext context, {
    required Map<String, TextEditingController> controllers,
    required int id,
    required String pickedImage,
  }) async {
    try {
      isLoading = true;
      final product = ProductModel(
        id: id,
        title: controllers[ApiStrings.title]!.text,
        description: controllers[ApiStrings.description]!.text,
        price: num.tryParse(controllers[ApiStrings.price]!.text),
      );

      await productRepo.editProduct(
        product: product,
        pickedImage: pickedImage,
      );

      getProducts();

      if (context.mounted) {
        context.back();
        context.showBarMessage('Product Updated Successfully');
      }
      isLoading = false;
    } on FetchDataException catch (e) {
      Log.e('Fetch Data Exception ${e.toString()}');
      isLoading = false;
    } on SocketException {
      isLoading = false;
    } on TimeoutException {
      isLoading = false;
    }
  }

  //! Delete Products ===================================
  Future<void> deleteProduct(BuildContext context, {required int id}) async {
    try {
      isLoading = true;
      await productRepo.deleteProduct(id: id);
      getProducts();
      if (context.mounted) {
        context.back();
        context.showBarMessage('Delete Product');
      }
      isLoading = false;
    } on FetchDataException catch (e) {
      Log.e('Fetch Data Exception ${e.toString()}');
      isLoading = false;
    } on SocketException {
      isLoading = false;
    } on TimeoutException {
      isLoading = false;
    }
  }

  // * Search For Products =========================================
  void searchedProductsToSearchedList(String searchedProducts) {
    searchedProductsList = products
        .where((element) =>
            element.title!.toLowerCase().startsWith(searchedProducts))
        .toList();
    notifyListeners();
  }

  void clearSearch({required TextEditingController searchController}) {
    searchedProductsList.clear();
    searchController.clear();
    notifyListeners();
  }
}
