import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData lightMode (){
 return ThemeData(
    fontFamily: 'cairo',
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColor.blue,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
  );
}