import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kakas_app/src/core/data/remote/response/api_strings.dart';
import 'package:kakas_app/src/core/extensions/animation_extensions.dart';
import 'package:kakas_app/src/core/extensions/extensions.dart';
import 'package:kakas_app/src/core/shared_widgets/pick_image/pick_single_image/pick_single_image_widget.dart';
import 'package:kakas_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:kakas_app/src/screens/products/model/product_model.dart';
import 'package:kakas_app/src/screens/shared/media/view_models/media_view_model.dart';
import 'package:provider/provider.dart';

class AddProductWidget extends StatelessWidget {
  final Map<String, TextEditingController> controllers;
  final ProductModel? product;

  const AddProductWidget({super.key, required this.controllers, this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<MediaVM>(
      builder: (context, mediaVM, child) {
        return HookBuilder(builder: (context) {
          useEffect(() {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              mediaVM.clearFiles();
            });

            return () {};
          }, []);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! Image ---------------
              Center(
                child: SinglePickImageWidget(
                  pickedResult: mediaVM.filesPaths.firstOrNull,
                  networkImage: product?.image,
                ),
              ),

              context.xLargeGap,

              //! Name Field ---------------
              BaseTextField(
                      suffixIcon: const Icon(CupertinoIcons.square_pencil),
                      controller: controllers[ApiStrings.title],
                      textInputType: TextInputType.name,
                      title: "Title")
                  .rightSlide,

              context.fieldsGap,

              //! Price Field ---------------
              BaseTextField(
                controller: controllers[ApiStrings.price],
                suffixIcon: const Icon(CupertinoIcons.money_dollar),
                textInputType: TextInputType.number,
                title: "Price",
              ).leftSlide,
            ],
          );
        });
      },
    );
  }
}
