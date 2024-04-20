import 'package:flutter/material.dart';
import 'package:kakas_app/src/core/shared_widgets/pick_image/pick_single_image/widgets/pick_image_button.dart';
import 'package:kakas_app/src/core/shared_widgets/pick_image/pick_single_image/widgets/view_network_image.dart';
import 'package:kakas_app/src/core/shared_widgets/pick_image/pick_single_image/widgets/view_picked_image.dart';

class SinglePickImageWidget extends StatelessWidget {
  final String? pickedResult;
  final String? networkImage;

  const SinglePickImageWidget({
    super.key,
    this.networkImage,
    this.pickedResult,
  });

  @override
  Widget build(BuildContext context) {
    final showPickImageButton = pickedResult == null && networkImage == null;

    //! Pick Image Button ========================================
    if (showPickImageButton) {
      return const PickImageButton();
    }

    final pickResultIsNotNull = pickedResult != null;

    //! View Picked Image ========================================
    if (pickResultIsNotNull) {
      return ViewPickedImage(
        pickedResult: pickedResult!,
      );
    }

    //! View Network Image ========================================
    return ViewNetworkImage(
      viewedNetworkImage: networkImage!,
    );
  }
}
