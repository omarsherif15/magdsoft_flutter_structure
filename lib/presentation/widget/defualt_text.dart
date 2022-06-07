import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class DefaultText extends StatelessWidget {
  String text;
  Color? color;
  double? size;

  DefaultText({
    required this.text,
    this.color,
    this.size,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? AppColor.blue,
        fontSize: size?? 25,
        fontFamily: 'cairo',
      ),
    );
  }
}
