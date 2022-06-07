import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

import '../../i18n/local_keys.g.dart';

class DefaultFormField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  TextInputType keyboardType;
  String? Function(String?)? validate;
  bool isPassword;
  IconData? suffix;
  void Function()? suffixPressed;

  DefaultFormField({
    Key? key,
   required this.controller,
   required this.hintText,
   required this.keyboardType,
    this.validate,
    this.isPassword = false,
    this.suffix,
    this.suffixPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      textAlign: TextAlign.start,
      style: TextStyle(color: AppColor.grey,fontSize: 20),
      validator: validate ?? (value)
      {
        if(value!.isEmpty) {
          return LocaleKeys.empty_field.tr();
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 17, color: AppColor.grey),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: AppColor.borderGrey)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: AppColor.borderGrey)),
        suffixStyle: TextStyle(color: AppColor.grey),
        suffixIcon:
          suffix != null
              ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffix, color: AppColor.grey))
              : null,
      ),
    );
  }
}
