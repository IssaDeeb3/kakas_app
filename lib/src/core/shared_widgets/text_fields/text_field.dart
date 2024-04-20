part of '../shared_widgets.dart';

class BaseTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputType textInputType;
  final Function(String)? onChanged;
  final TextAlign textAlign;
  final Function()? onTap;
  final EdgeInsetsGeometry contentPadding;
  final Widget? icon;
  final Widget? suffixIcon;
  final String? label;
  final String? hint;
  final int maxLines;
  final String? ignoringMessage;
  final String? Function(String?)? validator;
  final bool isObscure;
  final bool isRequired;
  final String? initialValue;
  final String? title;
  final bool? enabled;

  const BaseTextField({
    super.key,
    this.ignoringMessage,
    this.enabled = true,
    this.focusNode,
    this.controller,
    this.isObscure = false,
    this.onTap,
    this.hint,
    this.icon,
    this.suffixIcon,
    this.label,
    this.onChanged,
    this.initialValue,
    this.textAlign = TextAlign.start,
    this.contentPadding = const EdgeInsets.only(
      top: AppSpaces.defaultPadding + 2,
      left: AppSpaces.largePadding,
    ),
    this.textInputType = TextInputType.text,
    this.maxLines = 1,
    this.isRequired = true,
    this.validator,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: context.labelLarge,
          ),
          context.smallGap,
        ],

        //! Text Field
        _textField(context),
      ],
    );
  }

  Widget _textField(BuildContext context) {
    validations(value) {
      if (textInputType == TextInputType.number) {
        return Validations.numbersOnly(context, value);
      } else if (textInputType == TextInputType.emailAddress) {
        return Validations.email(context, value);
      } else if (textInputType == TextInputType.phone) {
        return Validations.phoneNumber(context, value);
      }
      return Validations.mustBeNotEmpty(context, value);
    }

    return TextFormField(
      enabled: enabled,
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      cursorColor: ColorManager.primaryColor,
      focusNode: focusNode,
      obscureText: isObscure,
      controller: controller,
      keyboardType: textInputType,
      inputFormatters: [
        if (textInputType == TextInputType.number)
          FilteringTextInputFormatter.allow(RegExp(r'[0-9.-]')),
      ],
      textAlign: textAlign,
      onTap: onTap,
      onChanged: onChanged,
      initialValue: initialValue,
      maxLines: maxLines,
      validator: isRequired ? (validator ?? validations) : null,
      style: context.labelMedium,
      decoration: InputDecoration(
        fillColor: Colors.blueGrey.shade50,
        filled: true,
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(AppRadius.extraLargeContainerRadius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(AppRadius.extraLargeContainerRadius),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(AppRadius.extraLargeContainerRadius),
          borderSide: BorderSide.none,
        ),
        hintText: hint ?? title ?? '',
        hintStyle: context.hint,
        contentPadding: contentPadding,
        labelText: label,
        suffixIcon: (suffixIcon ?? const SizedBox()),
        prefixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.only(
                    right: AppSpaces.smallPadding,
                    left: AppSpaces.smallPadding),
                child: icon,
              )
            : null,
      ),
    );
  }
}
