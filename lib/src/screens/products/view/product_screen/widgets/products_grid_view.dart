import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakas_app/src/core/extensions/extensions.dart';
import 'package:kakas_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:kakas_app/src/screens/products/view/product_screen/widgets/product_card.dart';
import 'package:kakas_app/src/screens/products/view_model/product_view_model.dart';
import 'package:kakas_app/src/screens/shared/animations/entrance_fader.dart';
import 'package:provider/provider.dart';

class ProductsGridView extends StatelessWidget {
  final TextEditingController searchController;

  const ProductsGridView({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsVM>(
      builder: (context, productsVM, child) {
        final isSearching = searchController.text.isNotEmpty;

        if (productsVM.isLoading) {
          return const LoadingWidget();
        }

        if (productsVM.products.isEmpty) {
          return Center(
            child: Text(
              'No products added',
              strutStyle: const StrutStyle(
                forceStrutHeight: true,
              ),
              style: context.headLine.copyWith(
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          );
        }

        if (isSearching && productsVM.searchedProductsList.isEmpty) {
          return Column(
            children: [
              context.xLargeGap,
              Text(
                'No results found',
                strutStyle: const StrutStyle(
                  forceStrutHeight: true,
                ),
                style: context.headLine.copyWith(
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ],
          );
        }

        return AutoHeightGridView(
            itemCount: isSearching
                ? productsVM.searchedProductsList.length
                : productsVM.products.length,
            crossAxisCount: 2,
            mainAxisSpacing: 15.h,
            crossAxisSpacing: 10,
            builder: (BuildContext context, int index) {
              return EntranceFader(
                delay: Duration(milliseconds: 300 * index),
                child: SellerProductCard(
                  product: productsVM.products[index],
                ),
              );
            });
      },
    );
  }
}
