import 'dart:async';

import 'package:kakas_app/src/core/data/remote/app_exception.dart';
import 'package:kakas_app/src/core/data/remote/network/base_api_service.dart';
import 'package:kakas_app/src/core/data/remote/response/api_end_points.dart';
import 'package:kakas_app/src/core/utils/logger.dart';
import 'package:kakas_app/src/screens/products/model/product_model.dart';

class ProductRepository {
  final BaseApiServices networkApiServices;

  ProductRepository({
    required this.networkApiServices,
  });

  //! Get Products ===================================
  Future<List<ProductModel>> getProducts() async {
    try {
      final response =
          await networkApiServices.getResponse(ApiEndPoints.products);

      final productsData =
          (response as List).map((e) => ProductModel.fromJson(e)).toList();
      return productsData;
    } on FetchDataException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

  //! Add Products ===================================
  Future<void> addProduct({
    required ProductModel product,
    required String? pickedImage,
  }) async {
    try {
      final uploadResponse = await networkApiServices
          .uploadImage(ApiEndPoints.upload, fileResult: pickedImage ?? '');

      final imageURL = uploadResponse['url'];

      final addProductResponse = await networkApiServices.postResponse(
        ApiEndPoints.products,
        data: product.toJson(image: imageURL),
      );

      Log.i('Add Product Response => $addProductResponse');
    } on FetchDataException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

  //! Edit Products ===================================
  Future<void> editProduct(
      {required ProductModel product, required String? pickedImage}) async {
    try {
      String? imageURL;

      if (pickedImage != null && pickedImage.isNotEmpty) {
        final uploadResponse = await networkApiServices
            .uploadImage(ApiEndPoints.upload, fileResult: pickedImage ?? '');

        imageURL = uploadResponse['url'];
      }

      await networkApiServices.putResponse(
          '${ApiEndPoints.products}?id=${product.id}',
          data: product.toJson(
            image: imageURL,
          ));
    } on FetchDataException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }

  //! Delete Products ===================================
  Future<void> deleteProduct({required int id}) async {
    try {
      await networkApiServices
          .deleteResponse('${ApiEndPoints.products}?id=$id');
    } on FetchDataException {
      rethrow;
    } on TimeoutException {
      rethrow;
    }
  }
}
