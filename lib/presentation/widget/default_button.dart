import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/defualt_text.dart';

class DefaultButton extends StatelessWidget {
  VoidCallback onTap;
  String text;
  Color? color;
  Color? textColor;
  double? width;
  double? height;

  DefaultButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.color,
    this.textColor,
    this.width,
    this.height,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height??60,
        width: width??150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color??AppColor.blue
        ),
        child: DefaultText(text: text,color: textColor ?? AppColor.white,size: 20,isButton: true,)
      ),
    );
  }
}
