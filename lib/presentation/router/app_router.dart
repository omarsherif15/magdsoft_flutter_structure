import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';
import 'package:magdsoft_flutter_structure/i18n/local_keys.g.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/register/register_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/user_profile.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

import '../screens/login/login_screen.dart';
import '../screens/shared/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case '/profile':
        if(args is LoginResponse) {
          return MaterialPageRoute(builder: (_) => UserProfile(args),);
        }
        else{
          showToast(LocaleKeys.error_occurred.tr());
          return MaterialPageRoute(builder: (_) => LoginScreen());
        }
        break;
      default:
        return null;
    }
  }
}