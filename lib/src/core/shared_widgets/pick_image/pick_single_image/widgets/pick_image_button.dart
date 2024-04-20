import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakas_app/gen/assets.gen.dart';
import 'package:kakas_app/src/core/extensions/extensions.dart';
import 'package:kakas_app/src/core/resources/app_radius.dart';
import 'package:kakas_app/src/core/shared_widgets/icon_widget/icon_widget.dart';
import 'package:kakas_app/src/screens/shared/media/view_models/media_view_model.dart';
import 'package:provider/provider.dart';

class PickImageButton extends StatelessWidget {
  final int oldFilesLength;

  const PickImageButton({this.oldFilesLength = 0});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => context
          .read<MediaVM>()
          .pickFile(context, oldFilesLength: oldFilesLength),
      child: Container(
        height: 120.h,
        width: 150.w,
        alignment: Alignment.center,
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(AppRadius.baseContainerRadius),
          dashPattern: const [
            10,
            10,
          ],
          color: Colors.grey,
          strokeWidth: 2,
          child: Container(
              height: 120.h,
              width: 150.w,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconWidget(
                    height: 50.h,
                    width: 50.w,
                    icon: Assets.icons.pickImage.path,
                  ),
                  Text(
                    "Click to browse",
                    style: context.labelSmall.copyWith(
                        color: Colors.blue, fontWeight: FontWeight.w400),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
