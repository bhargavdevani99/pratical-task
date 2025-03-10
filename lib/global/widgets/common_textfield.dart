import 'package:boiler_plate/global/config/app_colors.dart';
import 'package:boiler_plate/global/config/text_style.dart';
import 'package:boiler_plate/global/utils/validation/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {

  final String? title;
  final String? hintText;
  final String? validationMessage;
  final bool needValidation;
  final bool isEmailValidation;
  final double? topPadding;
  final double? bottomPadding;
  final TextEditingController? controller;
  final bool isPhoneValidation;
  final bool isPasswordValidation;
  final TextInputType? textInputType;
  final int? maxLine;
  final int? maxLength;
  final TextCapitalization? textCapitalization;
  final bool border;
  final double? borderRadius;
  final double? textSize;
  final Widget? suffixIcon;
  final TextStyle? hintStyle;
  final Color? borderColor;
  final Widget? prefixIcon;
  final TextAlign? textAlign;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final bool isTransparentColorBorder;
  final bool isBigTitle;
  final bool autofocus;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final bool obscureText;
  final bool boxShadow;
  final Color? titleColor;
  final Color? textColor;
  final bool readOnly;
  final bool isConformPassword;
  final Color? bgColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? titleMargin;

  const CommonTextField({
    super.key,
    this.title,
    this.needValidation = false,
    this.isEmailValidation = false,
    this.hintText,
    this.validationMessage,
    this.topPadding,
    this.borderColor,
    this.bottomPadding,
    this.controller,
    this.focusNode,
    this.textCapitalization,
    this.autofocus = false,
    this.boxShadow = true,
    this.readOnly = false,
    this.isConformPassword = false,
    this.textSize,
    this.contentPadding,
    this.isPhoneValidation = false,
    this.textInputType,
    this.textAlign,
    this.borderRadius,
    this.inputFormatters,
    this.maxLine,
    this.maxLength,
    this.hintStyle,
    this.bgColor,
    this.isTransparentColorBorder = true,
    this.onTap,
    this.suffixIcon,
    this.isBigTitle = false,
    this.prefixIcon,
    this.validator,
    this.border = false,
    this.titleColor,
    this.isPasswordValidation = false,
    this.obscureText = false,
    this.onChange,
    this.margin,
    this.titleMargin,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: topPadding ?? 0),
        if (title != null)
          Container(
            margin: margin,
            child: Text(
              '$title',
              style: isBigTitle
                  ? AppTextStyle.regular900.copyWith(
                      fontSize: 17,
                      color: AppColors.black,
                    )
                  : AppTextStyle.regular900.copyWith(
                      fontSize: 15,
                      color: AppColors.black,
                    ),
            ),
          ),
        if (title != null) const SizedBox(height: 11),
        Container(
          margin: margin,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            boxShadow: boxShadow == false
                ? kElevationToShadow[0]
                : [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 33,
                      spreadRadius: 0,
                      color: const Color(0xFFA7A9B7).withOpacity(0.3),
                    ),
                  ],
          ),
          child: TextFormField(
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            maxLines: maxLine ?? 1,
            textAlign: textAlign ?? TextAlign.start,
            onTap: onTap,
            maxLength: maxLength,
            controller: controller,
            onChanged: onChange,
            obscureText: obscureText,
            readOnly: readOnly,
            inputFormatters: inputFormatters ?? [],
            focusNode: focusNode,
            autofocus: autofocus,
            keyboardType: textInputType ?? TextInputType.text,
            style: AppTextStyle.regular900
                .copyWith(fontSize: textSize ?? 15, color: textColor),
            decoration: InputDecoration(
              fillColor: bgColor ?? AppColors.white,
              contentPadding: contentPadding ??
                  const EdgeInsets.only(
                    top: 13,
                    bottom: 16,
                    right: 20,
                    left: 20,
                  ),
              isDense: true,
              filled: true,
              counterText: "",
              hintText: hintText ?? "",
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              hintStyle: hintStyle ??
                  AppTextStyle.regular400.copyWith(
                    color: borderColor ?? AppColors.black,
                    fontSize: 13,
                  ),
              border: border == false
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isTransparentColorBorder
                            ? AppColors.transparent
                            : (borderColor ?? AppColors.grey),
                      ),
                      borderRadius: BorderRadius.circular(borderRadius ?? 10),
                    )
                  : OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.black,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
              enabledBorder: border == false
                  ? OutlineInputBorder(
                      borderSide: BorderSide(
                        color: isTransparentColorBorder
                            ? AppColors.transparent
                            : (borderColor ?? AppColors.grey),
                      ),
                      borderRadius: BorderRadius.circular(borderRadius ?? 10),
                    )
                  : OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.white,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
            ),
            validator: needValidation
                ? validator ??
                    (v) {
                      return TextFieldValidation.validation(
                        message: validationMessage ?? title,
                        value: v,
                        isConformPasswordValidator: isConformPassword,
                        isPasswordValidator: isPasswordValidation,
                        isPhone: isPhoneValidation,
                        isEmailValidator: isEmailValidation,
                      );
                    }
                : null,
          ),
        ),
        SizedBox(height: bottomPadding ?? 16),
      ],
    );
  }
}
