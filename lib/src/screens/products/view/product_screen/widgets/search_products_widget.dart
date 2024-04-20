import 'package:flutter/material.dart';
import 'package:kakas_app/src/core/extensions/extensions.dart';
import 'package:kakas_app/src/core/resources/app_spaces.dart';
import 'package:kakas_app/src/core/shared_widgets/search/search_widget.dart';
import 'package:kakas_app/src/screens/products/view_model/product_view_model.dart';
import 'package:provider/provider.dart';

class SearchProductsWidget extends StatelessWidget {
  final TextEditingController searchController;

  const SearchProductsWidget({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsVM>(
      builder: (context, productsVM, child) {
        Widget searching() {
          if (searchController.text.isNotEmpty) {
            return InkWell(
                onTap: () {
                  productsVM.clearSearch(searchController: searchController);
                },
                child: const Icon(Icons.close));
          } else {
            return const Icon(Icons.search_rounded);
          }
        }

        return SearchWidget(
            searchController: searchController,
            onChanged: (searchedProducts) {
              productsVM.searchedProductsToSearchedList(searchedProducts);
            },
            suffixIcon: searching());
      },
    ).paddingAll(AppSpaces.defaultPadding);
  }
}
