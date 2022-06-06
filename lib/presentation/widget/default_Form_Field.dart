import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class DefaultFormField extends StatelessWidget {
  BuildContext context;
  TextEditingController controller;
  String hintText;
  TextInputType keyboardType;
  String? Function(String?) validate;
  bool? isPassword;
  IconData? suffix;
  void Function()? suffixPressed;

  DefaultFormField({
    Key? key,
   required this.context,
   required this.controller,
   required this.hintText,
   required this.keyboardType,
   required this.validate,
    this.isPassword,
    this.suffix,
    this.suffixPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword ?? false,
      textAlign: TextAlign.start,
      validator: validate,
      style: Theme.of(context).textTheme.bodyText1,
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
