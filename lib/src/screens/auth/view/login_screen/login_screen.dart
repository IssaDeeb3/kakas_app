import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakas_app/src/core/extensions/animation_extensions.dart';
import 'package:kakas_app/src/core/extensions/extensions.dart';
import 'package:kakas_app/src/core/resources/app_radius.dart';
import 'package:provider/provider.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../core/data/remote/response/api_strings.dart';
import '../../../../core/resources/app_spaces.dart';
import '../../../../core/resources/theme/theme.dart';
import '../../../../core/shared_widgets/shared_widgets.dart';
import '../../view_model/auth_view_model.dart';
import '../signup_screen/signup_screen.dart';
import 'components/login_fields.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useState(GlobalKey<FormState>());

    final fieldsController = {
      ApiStrings.username: useTextEditingController(),
      ApiStrings.password: useTextEditingController(),
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
                            context.xLargeGap,

                            Assets.images.logo.image(
                              width: 100.w,
                            ),

                            context.largeGap,

                            Text(
                              'Let\'s Login to your\naccount first!',
                              style: context.headLine,
                              textAlign: TextAlign.center,
                            ),

                            context.xLargeGap,

                            //! Login formField
                            LoginFields(controllers: fieldsController),
                            context.largeGap,

                            //! Login Button
                            Button(
                                isLoading: authVM.isLoading,
                                label: 'Login',
                                onPressed: () {
                                  if (formKey.value.currentState!.validate()) {
                                    authVM.login(
                                        controllers: fieldsController, context);
                                  }
                                }).bottomSlide,

                            context.mediumGap,
                            //! Don't have an account
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t Have An Account?',
                                  style: context.labelMedium,
                                ),
                                TextButton(
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.zero),
                                    ),
                                    onPressed: () =>
                                        context.to(const SignupScreen()),
                                    child: Text(
                                      'Signup',
                                      style: context.labelMedium.copyWith(
                                          color: ColorManager.primaryColor,
                                          decoration: TextDecoration.underline,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),

                            context.xLargeGap,
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
