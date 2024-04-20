import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kakas_app/src/core/data/remote/response/api_strings.dart';
import 'package:kakas_app/src/core/extensions/animation_extensions.dart';
import 'package:kakas_app/src/core/extensions/extensions.dart';
import 'package:kakas_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:kakas_app/src/screens/products/model/product_model.dart';
import 'package:kakas_app/src/screens/shared/media/view_models/media_view_model.dart';
import 'package:provider/provider.dart';

import '../../../../core/resources/app_spaces.dart';
import '../../view_model/product_view_model.dart';
import 'widgets/add_product_widget.dart';

class AddProductScreen extends HookWidget {
  final ProductModel? product;

  const AddProductScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    final fieldsControllers = {
      ApiStrings.title: useTextEditingController(text: product?.title),
      ApiStrings.description:
          useTextEditingController(text: product?.description),
      ApiStrings.price:
          useTextEditingController(text: product?.price.toString()),
    };
    final formKey = useState(GlobalKey<FormState>());
    final productVM = context.read<ProductsVM>();
    final mediaVM = context.read<MediaVM>();
    final isEdit = product != null;

    Future<void> addOrEditProduct() async {
      if (isEdit) {
        await productVM.editProduct(
          context,
          controllers: fieldsControllers,
          id: product!.id!,
          pickedImage: mediaVM.filesPaths.firstOrNull ?? '',
        );
      } else {
        await productVM.addProduct(context,
            controllers: fieldsControllers,
            pickedImage: mediaVM.filesPaths.firstOrNull ?? '');
      }
    }

    //! ==============================
    Future<void> validateAndAddEditCategory() async {
      if (mediaVM.filesPaths.isEmpty && !isEdit) {
        context.showBarMessage(
          "Please select an image",
          isError: true,
        );
        return;
      }

      if (!formKey.value.currentState!.validate()) return;

      await addOrEditProduct();
    }

    return Form(
      key: formKey.value,
      child: Consumer<ProductsVM>(
        builder: (context, productVM, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isEdit ? "Edit Product" : "Add Product",
                style: context.title,
              ),
              Column(
                children: [
                  context.largeGap,
                  AddProductWidget(
                    product: product,
                    controllers: fieldsControllers,
                  ),
                  context.xLargeGap,
                  Button(
                      label: isEdit ? "Edit Product" : "Add Product",
                      isLoading: productVM.isLoading,
                      onPressed: () async {
                        await validateAndAddEditCategory();
                        // if (!context.mounted) return;
                        // context.toReplacement(const ProductsScreen());
                      }).bottomSlide,
                ],
              ).paddingAll(AppSpaces.smallPadding)
            ],
          ).scroll();
        },
      ),
    );
  }
}
