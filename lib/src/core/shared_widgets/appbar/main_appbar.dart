import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakas_app/src/core/extensions/extensions.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isBackButton;
  final String? title;
  final bool isLeading;
  final Widget? actionWidget;
  final Function()? onBackPressed;

  const MainAppBar({
    super.key,
    this.actionWidget,
    this.isLeading = true,
    this.isBackButton = true,
    this.title,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      scrolledUnderElevation: 0,
      elevation: 0,
      bottomOpacity: 0,
      shadowColor: Colors.black,
      title: title == null
          ? null
          : Text(
              title!,
              style: context.title,
            ),
      actions: actionWidget == null ? null : [actionWidget!],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
