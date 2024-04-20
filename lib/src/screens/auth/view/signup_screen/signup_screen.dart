import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakas_app/src/core/extensions/animation_extensions.dart';
import 'package:kakas_app/src/core/extensions/extensions.dart';
import 'package:kakas_app/src/core/resources/app_radius.dart';
import 'package:kakas_app/src/screens/auth/view/login_screen/login_screen.dart';
import 'package:kakas_app/src/screens/auth/view/signup_screen/view/components/signup_fields.dart';
import 'package:provider/provider.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/data/remote/response/api_strings.dart';
import '../../../../core/resources/app_spaces.dart';
import '../../../../core/resources/theme/theme.dart';
import '../../../../core/shared_widgets/shared_widgets.dart';
import '../../view_model/auth_view_model.dart';

class SignupScreen extends HookWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useState(GlobalKey<FormState>());

    final fieldsController = {
      ApiStrings.username: useTextEditingController(),
      ApiStrings.email: useTextEditingController(),
      ApiStrings.password: useTextEditingController(),
      ApiStrings.confirmPassword: useTextEditingController(),
    };

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Form(
          key: formKey.value,
          child: Stack(
            children: [
              //! Background Image
              Assets.animation.loginBackground.lottie(
                height: context.height,
                fit: BoxFit.cover,
              ),

              //! Fields Container
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: AppSpaces.defaultPadding,
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppRadius.largeContainerRadius))),
                  padding: const EdgeInsets.all(AppSpaces.defaultPadding),
                  child: SingleChildScrollView(
                    child: Consumer<AuthVM>(
                      builder: (context, authVM, child) {
                        return Column(
                          children: [
                            context.smallGap,

                            Assets.images.logo.image(
                              width: 100.w,
                            ),

                            context.largeGap,

                            Text(
                              'Create an account\nand get started!',
                              style: context.headLine,
                              textAlign: TextAlign.center,
                            ),

                            context.xLargeGap,

                            //! Signup formField
                            SignupFields(
                              fields: fieldsController,
                            ),

                            context.xLargeGap,
                            //! Signup Button
                            Button(
                                label: 'Signup',
                                isLoading: authVM.isLoading,
                                onPressed: () {
                                  if (formKey.value.currentState!.validate()) {
                                    authVM.registerUser(context,
                                        controllers: fieldsController);
                                  }
                                }).bottomSlide,

                            context.mediumGap,

                            //! Have an account
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Have An Account?',
                                  style: context.labelMedium,
                                ),
                                TextButton(
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.zero),
                                    ),
                                    onPressed: () =>
                                        context.to(const LoginScreen()),
                                    child: Text(
                                      'Login',
                                      style: context.labelMedium.copyWith(
                                          color: ColorManager.primaryColor,
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
