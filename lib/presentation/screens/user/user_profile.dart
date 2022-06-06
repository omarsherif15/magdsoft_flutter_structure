import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_button.dart';

import '../../../i18n/local_keys.g.dart';

class UserProfile extends StatelessWidget {
   UserProfile(this.userdata,{Key? key}) : super(key: key);

  LoginResponse ? userdata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.user_data.tr(),style: const TextStyle(fontSize: 25),),
        centerTitle: true,
        backgroundColor: AppColor.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text("${LocaleKeys.name.tr()}: ${userdata?.account[0].name}",style: TextStyle(color: AppColor.blue,fontSize: 25),),
                   Text("${LocaleKeys.email.tr()}: ${userdata?.account[0].email}",style: TextStyle(color: AppColor.blue,fontSize: 25)),
                   Text("${LocaleKeys.phone.tr()}: ${userdata?.account[0].phone}",style: TextStyle(color: AppColor.blue,fontSize: 25)),

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
          ),
        ),
      ),
    );
  }
}
