import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';

import '../../i18n/local_keys.g.dart';
import '../styles/colors.dart';
import '../widget/default_button.dart';
import '../widget/defualt_text.dart';

class UserProfileView extends StatelessWidget {
  LoginResponse userdata;
  UserProfileView (this.userdata,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DefaultText(text: "${LocaleKeys.name.tr()}: ${userdata.account[0].name}",),
            DefaultText(text:"${LocaleKeys.email.tr()}: ${userdata.account[0].email}",),
            DefaultText(text:"${LocaleKeys.phone.tr()}: ${userdata.account[0].phone}",),
          ],
        ),
        const Spacer(),
        DefaultButton(
          onTap: (){
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          },
          color: AppColor.red,
          text: LocaleKeys.logout.tr(),
        )
      ],
    );
  }
}
