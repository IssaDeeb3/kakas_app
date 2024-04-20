import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakas_app/gen/assets.gen.dart';
import 'package:kakas_app/src/core/consts/app_constants.dart';
import 'package:kakas_app/src/core/extensions/extensions.dart';
import 'package:kakas_app/src/core/resources/app_radius.dart';
import 'package:kakas_app/src/core/resources/app_spaces.dart';
import 'package:kakas_app/src/core/resources/theme/theme.dart';
import 'package:kakas_app/src/core/shared_widgets/box_shadow.dart';
import 'package:kakas_app/src/core/shared_widgets/dialogs/alert_dialog.dart';
import 'package:kakas_app/src/core/shared_widgets/icon_widget/icon_widget.dart';
import 'package:kakas_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:kakas_app/src/screens/products/model/product_model.dart';
import 'package:provider/provider.dart';

import '../../../view_model/product_view_model.dart';
import '../../add_products/add_product.dart';

class SellerProductCard extends StatelessWidget {
  final ProductModel product;

  const SellerProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsVM>(
      builder: (context, productVM, child) {
        return Container(
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppRadius.imageContainerRadius),
              color: Theme.of(context).cardColor,
              boxShadow: ConstantsWidgets.boxShadow),
          child: Stack(
            children: [
              //! image & details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! Product image
                  SizedBox(
                    height: 160.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppRadius.imageContainerRadius,
                      ),
                      child: Image.network(product.image ?? '',
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Center(
                              child:
                                  IconWidget(icon: Assets.icons.noImage.path))),
                    ),
                  ),

                  context.smallGap,

                  //! product title & price & sale price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //! Product Title
                      Text(
                        product.title ?? '',
                        style: context.subTitle.copyWith(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      context.xSmallGap,
                      //! price and currency
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //! Currency
                          Text(AppConsts.currency,
                              style: context.labelLarge.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue)),

                          //! Price
                          Text('${product.price}',
                              style:
                                  context.title.copyWith(color: Colors.blue)),
                        ],
                      ),
                    ],
                  ).paddingOnly(
                      left: AppSpaces.smallPadding,
                      right: AppSpaces.smallPadding),
                ],
              ),

              //! Delete button
              Positioned(
                left: 0,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      color: ColorManager.red,
                      borderRadius: BorderRadius.only(
                        bottomRight:
                            Radius.circular(AppRadius.imageContainerRadius),
                        topLeft:
                            Radius.circular(AppRadius.imageContainerRadius),
                      )),
                  child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialogWidget(
                                isWarningMessage: true,
                                isLoading: productVM.isLoading,
                                message:
                                    "Are you sure you want to delete this product?",
                                onConfirm: () => productVM
                                    .deleteProduct(context, id: product.id!));
                          },
                        );
                      },
                      icon: BaseLottieIcon(
                        Assets.animation.delete.path,
                        height: AppSpaces.iconSize,
                      )),
                ),
              ),

              //! Edit button
              Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 17,
                  child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            showDragHandle: true,
                            context: context,
                            builder: (context) => Container(
                                  color: Colors.transparent,
                                  margin: const EdgeInsets.all(
                                      AppSpaces.defaultPadding),
                                  height:
                                      MediaQuery.of(context).size.height * 0.65,
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: AddProductScreen(
                                    product: product,
                                  ),
                                ));
                      },
                      icon: BaseLottieIcon(
                        Assets.animation.edit.path,
                        height: AppSpaces.iconSize,
                      )),
                ).frosted(
                  blur: 0.9,
                  frostColor: Colors.blueGrey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ).paddingOnly(
                right: AppSpaces.smallPadding,
                top: AppSpaces.smallPadding,
              ),
            ],
          ),
        );
      },
    );
  }
}
