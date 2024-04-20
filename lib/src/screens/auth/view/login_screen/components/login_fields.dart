import 'package:flutter/material.dart';
import 'package:kakas_app/src/core/extensions/animation_extensions.dart';
import 'package:kakas_app/src/core/extensions/extensions.dart';
import 'package:kakas_app/src/core/resources/app_spaces.dart';
import 'package:provider/provider.dart';

import '../../../../../core/data/remote/response/api_strings.dart';
import '../../../../../core/shared_widgets/shared_widgets.dart';
import '../../../view_model/auth_view_model.dart';

class LoginFields extends StatelessWidget {
  final Map<String, TextEditingController> controllers;

  const LoginFields({
    super.key,
    required this.controllers,
  });

  @override
  Widget build(BuildContext context) {
    final authVM = context.read<AuthVM>();
    return Column(
      children: [
        //! email formField
        BaseTextField(
          validator: (value) {
            if (value!.trim().isEmpty) {
              return 'Please Enter Your UserName';
            }
            return null;
          },
          controller: controllers[ApiStrings.username],
          textInputType: TextInputType.name,
          icon: const Icon(Icons.drive_file_rename_outline_rounded),
          title: 'User Name',
        ).rightSlide,
        context.fieldsGap,
        //! password formField provider
        BaseTextField(
          validator: (value) {
            if (value!.length < 8) {
              return 'password Must Contain 8 Characters';
            } else {
              return null;
            }
          },
          controller: controllers[ApiStrings.password],
          textInputType: TextInputType.visiblePassword,
          isObscure: authVM.isObscure,
          icon: const Icon(Icons.password),
          suffixIcon: InkWell(
              onTap: authVM.isObscurePassword,
              child: Icon(
                authVM.isObscure
                    ? Icons.remove_red_eye
                    : Icons.visibility_off_rounded,
                color: Colors.grey,
              )).paddingSymmetric(
            horizontal: AppSpaces.smallPadding,
          ),
          title: 'Password',
        ).leftSlide,
      ],
    );
  }
}
