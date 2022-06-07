import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../business_logic/login_cubit/login_cubit.dart';
import '../../i18n/local_keys.g.dart';
import '../widget/default_Form_Field.dart';
import '../widget/default_button.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height*2/3,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(43.0),
            topLeft: Radius.circular(43.0),
          )),
      child: Form(
        key: loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  DefaultFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: LocaleKeys.email.tr(),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  DefaultFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      isPassword: LoginCubit.get(context).showPassword ? true : false,
                      hintText: LocaleKeys.password.tr(),
                      suffix:  LoginCubit.get(context).suffixIcon,
                      suffixPressed:(){
                        setState(() {
                          LoginCubit.get(context).changeSuffixIcon(context);
                        });
                      }
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  DefaultButton(
                    text: LocaleKeys.register.tr(),
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/register', (route) => false);
                    },
                  ),
                  Spacer(),
                  DefaultButton(
                    text: LocaleKeys.login.tr(),
                    onTap: () {
                      if(loginFormKey.currentState!.validate()){
                        LoginCubit.get(context).userLogin(
                            email: emailController.text,
                            password: passwordController.text
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}
