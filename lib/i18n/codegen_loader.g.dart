// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "name": "اسم المستخدم",
  "full_name": "الاسم",
  "password": "كلمه السر",
  "confirm_password": "تأكيد كلمه السر",
  "password_match": "كلمه السر غير متشابها",
  "phone": "رقم الهاتف",
  "email": "البريذ الالكتروني",
  "login": "تسجيل الدخول",
  "register": "اشتراك",
  "logout": "تسجيل الخروج",
  "success": "تم بنجاح",
  "loading": "جاري التحميل ...",
  "error_occurred": "حدث خطأ برجاء المحاوله مره اخري",
  "user_data": "بيانات المستخدم",
  "language_button": "English",
  "empty_field": "يجب ملأ هذه الخانه"
};
static const Map<String,dynamic> en = {
  "name": "Full Name",
  "full_name": "Name",
  "password": "Password",
  "confirm_password": "Confirm Password",
  "password_match": "Password Doesn't match",
  "phone": "Phone",
  "email": "Email",
  "login": "Login",
  "register": "Register",
  "logout": "Logout",
  "success": "success",
  "loading": "loading...",
  "error_occurred": "Error Occurred, Try again",
  "user_data": "User Data",
  "language_button": "عربي",
  "empty_field": "This Field must be filled"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
