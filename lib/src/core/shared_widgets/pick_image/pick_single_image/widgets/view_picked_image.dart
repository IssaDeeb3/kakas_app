import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakas_app/src/core/shared_widgets/pick_image/pick_single_image/widgets/view_network_image.dart';

class ViewPickedImage extends StatelessWidget {
  final String? pickedResult;

  const ViewPickedImage({required this.pickedResult});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //! Picked Image
        Container(
          height: 120.h,
          width: 150.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.file(
              File(pickedResult!),
              fit: BoxFit.cover,
            ),
          ),
        ),

        //! Edit button
        const EditButton(),
      ],
    );
  }
}
