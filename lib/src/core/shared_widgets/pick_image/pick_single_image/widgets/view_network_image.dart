import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakas_app/gen/assets.gen.dart';
import 'package:kakas_app/src/core/resources/app_radius.dart';
import 'package:kakas_app/src/core/resources/app_spaces.dart';
import 'package:kakas_app/src/core/resources/theme/theme.dart';
import 'package:kakas_app/src/core/shared_widgets/shared_widgets.dart';
import 'package:kakas_app/src/screens/shared/media/view_models/media_view_model.dart';
import 'package:provider/provider.dart';

class ViewNetworkImage extends StatelessWidget {
  final String viewedNetworkImage;

  const ViewNetworkImage({required this.viewedNetworkImage});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //! Network Image
        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.baseContainerRadius),
          child: BaseCachedImage(
            viewedNetworkImage,
            height: 120.h,
            width: 150.w,
          ),
        ),

        //! Edit button
        const EditButton(),
      ],
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 7,
      child: CircleAvatar(
        maxRadius: 20,
        backgroundColor: ColorManager.primaryColor.withOpacity(0.8),
        child: IconButton(
            onPressed: () => context.read<MediaVM>().pickFile(context),
            icon: BaseLottieIcon(
              Assets.animation.edit.path,
              height: AppSpaces.iconSize,
            )),
      ),
    );
  }
}
