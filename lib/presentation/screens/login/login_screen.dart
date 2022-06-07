import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_cubit.dart';
import 'package:magdsoft_flutter_structure/i18n/local_keys.g.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/login_form.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_Form_Field.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (context) => LoginCubit(),
      child: BlocConsumer <LoginCubit , LoginState> (
        listener: (context,state){
          if(state is LoginSuccessfulState){
            showToast(LocaleKeys.success.tr());
            Navigator.pushNamedAndRemoveUntil(
                context, '/profile', (route) => false ,arguments: state.loginResponse);
          }
          else  if(state is LoginErrorState)
            {
              showToast(LocaleKeys.error_occurred.tr());
            }
          else  if(state is LoginLoadingState)
          {
            showToast(LocaleKeys.loading.tr());
          }
        },
        builder:  (context, state){
          return Scaffold(
            backgroundColor: AppColor.blue,
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: AppColor.blue,
                        padding: const EdgeInsetsDirectional.only(top: 30),
                        child: const Image(image: AssetImage('assets/images/logo.png')),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.only(top: 30,end: 25),
                        child: DefaultButton(
                          onTap: (){
                            GlobalCubit.get(context).changeLocal(context);
                          },
                          width: 80,
                          height: 40,
                          text: LocaleKeys.language_button.tr(),
                          textColor: Colors.black,
                          color: AppColor.white,
                        ),
                      )
                    ],
                  ),
                ),
                LoginForm()
              ],
            ),
          );
        },
      ),
    );
  }
}
