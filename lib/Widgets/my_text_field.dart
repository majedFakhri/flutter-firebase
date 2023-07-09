import 'package:firebase/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
import '../core/utils/app_colors.dart';
import '../core/utils/app_string.dart';

class MyTextField extends StatelessWidget {
  TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final Icon? icon;
  final TextInputType? textInputType;
  final bool? hideInput;
  final bool? readOnly;
  final VoidCallback? onTap;
  final String? validator;
  final PopupMenuButton? popupMenuButton;

  final double? fontSize;

  MyTextField({
    super.key,
    required this.controller,
    this.icon,
    this.labelText,
    this.hintText,
    this.textInputType,
    this.hideInput,
    this.readOnly,
    this.onTap,
    this.validator,
    this.fontSize,
    this.popupMenuButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
      child: TextFormField(
        validator: validator == "names"
            ? (value) {
                if (value == null) {
                  return "هذا الحقل مطلوب";
                } else if (value == "") {
                  return "هذا الحقل مطلوب";
                } else {
                  return null;
                }
              }
            : (value) {
                if (value != null) {
                  if (value.length < 8) {
                    return "كلمة السر يجب أن لاتقل عن 8 محارف";
                  } else {
                    return null;
                  }
                } else {
                  return "هذا الحقل مطلوب";
                }
              },
        onTap: onTap,
        readOnly: readOnly ?? false,
        obscureText: hideInput ?? false,
        keyboardType: textInputType,
        controller: controller,
        cursorColor: AppColors.secondaryColor,
        style: TextStyle(
          fontSize: fontSize ?? 20 * context.textScaleFactor,
          color: AppColors.secondaryColor,
          fontFamily: AppStrings.appFont,
        ),
        decoration: InputDecoration(
          suffixIcon: icon,
          suffixIconColor: AppColors.secondaryColor,
          hintStyle: TextStyle(
              fontSize: fontSize ?? 20 * context.textScaleFactor,
              color: AppColors.hintColor),
          hintText: hintText,
          labelText: labelText ?? '',
          labelStyle: TextStyle(
              color: AppColors.hintColor,
              fontSize: fontSize ?? 20 * context.textScaleFactor,
              fontFamily: AppStrings.appFont),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
              )),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2.5,
              color: AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
