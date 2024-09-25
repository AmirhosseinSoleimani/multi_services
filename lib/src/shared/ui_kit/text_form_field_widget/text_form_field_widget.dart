import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';


class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({super.key,
    this.labelText,
    required this.controller,
    this.focusNode,
    this.hintText,
    this.readOnly = false,
    this.isPassword = false,
    this.prefixIcon,
    this.textInputFormatter,
    this.hintStyle,
    this.textInputType,
    this.textStyle,
    this.onTap,
    this.suffixIcon,
    this.validator,
    this.newKey,
    this.error,
    this.onChanged,
    this.onFieldSubmitted,
    this.textInputAction,
    this.textAlign,
    this.borderCoder,
    this.focusBorderCoder,
    this.backgroundColor
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? hintText;
  final bool readOnly;
  final bool isPassword;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? textInputFormatter;
  final TextStyle? hintStyle;
  final TextInputType? textInputType;
  final String? labelText;
  final TextStyle? textStyle;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final Key? newKey;
  final String? error;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  final Color? borderCoder;
  final Color? focusBorderCoder;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: textAlign ?? TextAlign.start,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      key: newKey,
      validator: validator,
      onTap: onTap,
      readOnly: readOnly,
      controller: controller,
      focusNode: focusNode,
      obscureText: isPassword,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        fillColor: backgroundColor,
        filled: (backgroundColor != null) ? true : false,
        error: error !=null?Text(error!):null,
        labelText: labelText,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: hintStyle ??Theme.of(context).textTheme.titleMedium,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
            borderSide: BorderSide(
                width: AppSize.s2,
                color: borderCoder ?? Theme.of(context).colorScheme.onSurface)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
            borderSide: BorderSide(
                width: AppSize.s2,
                color: borderCoder ?? Theme.of(context).colorScheme.onSurface)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
            borderSide: BorderSide(
                width: AppSize.s2,
                color: focusBorderCoder ?? Theme.of(context).colorScheme.primary)),
      ),
      style: textStyle ?? Theme.of(context).textTheme.displayMedium,
      inputFormatters: textInputFormatter,
      onSaved: (value) {
        controller.text = value!;
      },
    );
  }
}