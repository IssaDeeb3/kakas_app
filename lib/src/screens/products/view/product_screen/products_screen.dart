import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kakas_app/src/core/extensions/extensions.dart';
import 'package:kakas_app/src/core/resources/app_spaces.dart';
import 'package:kakas_app/src/core/shared_widgets/appbar/main_appbar.dart';
import 'package:kakas_app/src/screens/auth/view_model/auth_view_model.dart';
import 'package:kakas_app/src/screens/products/view/add_products/add_product.dart';
import 'package:kakas_app/src/screens/products/view/product_screen/widgets/products_grid_view.dart';
import 'package:provider/provider.dart';

import '../../view_model/product_view_model.dart';
import 'widgets/search_products_widget.dart';

class ProductsScreen extends HookWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsVM = context.read<ProductsVM>();
    final searchController = useTextEditingController();

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        productsVM.getProducts();
      });
      return () {};
    }, []);

    return Scaffold(
      appBar: MainAppBar(
        title: 'Home Page',
        // logout
        actionWidget: IconButton(
          icon: const Icon(
            Icons.logout,
          ),
          onPressed: () {
            context.read<AuthVM>().logout(context);
          },
        ).paddingSymmetric(horizontal: 10),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.white,
              showDragHandle: true,
              context: context,
              builder: (context) => Container(
                    color: Colors.transparent,
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    margin: const EdgeInsets.all(AppSpaces.defaultPadding),
                    height: context.height * 0.65,
                    child: const AddProductScreen(),
                  ));
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          //! Search Products Widget
          SearchProductsWidget(
            searchController: searchController,
          ),

          //! Products Grid View
          Expanded(
            child: ProductsGridView(
              searchController: searchController,
            ),
          ),
        ],
      ),
    );
  }
}
