import '../../../core/data/remote/response/api_strings.dart';

class ProductModel {
  final int? id;
  final String? title;
  final String? description;
  final num? price;
  final String? image;

  ProductModel({this.price, this.image, this.title, this.id, this.description});

  //! Remote Constructor---------------------------------------
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json[ApiStrings.id],
      title: json[ApiStrings.title] ?? '',
      description: json[ApiStrings.description] ?? '',
      price: json[ApiStrings.price] ?? 0,
      image: json[ApiStrings.image],
    );
  }

  Map<String, dynamic> toJson({
    String? image,
  }) {
    return {
      if (title != null) ApiStrings.title: title,
      if (price != null) ApiStrings.price: price,
      if (image != null) ApiStrings.image: image,
    };
  }
}
