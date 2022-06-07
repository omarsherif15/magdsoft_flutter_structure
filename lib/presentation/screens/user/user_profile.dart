import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/user_profile_view.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/defualt_text.dart';

import '../../../i18n/local_keys.g.dart';

class UserProfile extends StatelessWidget {
   UserProfile(this.userdata,{Key? key}) : super(key: key);

  LoginResponse ? userdata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DefaultText(text: LocaleKeys.user_data.tr(),color: AppColor.white,),
        centerTitle: true,
        backgroundColor: AppColor.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: UserProfileView(userdata!)
      ),
    );
  }
}
