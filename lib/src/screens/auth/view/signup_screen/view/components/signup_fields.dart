import 'package:flutter/material.dart';
import 'package:kakas_app/src/core/extensions/animation_extensions.dart';
import 'package:kakas_app/src/core/extensions/extensions.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/data/remote/response/api_strings.dart';
import '../../../../../../core/resources/app_spaces.dart';
import '../../../../../../core/shared_widgets/shared_widgets.dart';
import '../../../../view_model/auth_view_model.dart';

class SignupFields extends StatelessWidget {
  final Map<String, TextEditingController> fields;

  const SignupFields({
    super.key,
    required this.fields,
  });

  @override
  Widget build(BuildContext context) {
    final authVM = context.read<AuthVM>();
    return Column(
      children: [
        //! User Name formField
        BaseTextField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Enter Your UserName';
            } else {
              return null;
            }
          },
          controller: fields[ApiStrings.username],
          textInputType: TextInputType.name,
          icon: const Icon(Icons.drive_file_rename_outline_rounded),
          title: 'User Name',
        ).rightSlide,

        context.fieldsGap,

        //! password formField provider
        BaseTextField(
          validator: (value) {
            if (value!.length < 8) {
              return 'Password Must Contain 8 Characters';
            } else {
              return null;
            }
          },
          controller: fields[ApiStrings.password],
          textInputType: TextInputType.visiblePassword,
          icon: const Icon(Icons.password_rounded),
          title: 'Password',
          isObscure: authVM.isObscure,
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
        ).leftSlide,

        context.fieldsGap,

        //! Confirm Password formField
        BaseTextField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Confirm Your Password';
            } else if (value != fields[ApiStrings.password]!.text) {
              return 'Password Does Not Match';
            } else {
              return null;
            }
          },
          controller: fields[ApiStrings.confirmPassword],
          textInputType: TextInputType.visiblePassword,
          icon: const Icon(Icons.password_rounded),
          title: 'Confirm Password',
          isObscure: authVM.isObscure,
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
        ).bottomSlide,
      ],
    );
  }
}
