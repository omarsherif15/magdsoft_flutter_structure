import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../business_logic/register_cubit/register_cubit.dart';
import '../../i18n/local_keys.g.dart';
import '../widget/default_Form_Field.dart';
import '../widget/default_button.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  var loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 2 / 3,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(),
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(43.0),
              topLeft: Radius.circular(43.0),
            )),
        child: SingleChildScrollView(
            child: Form(
          key: loginFormKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  children: [
                    DefaultFormField(

                        controller: nameController,
                        keyboardType: TextInputType.text,
                        hintText: LocaleKeys.name.tr(),
                        ),
                    const SizedBox(
                      height: 18,
                    ),
                    DefaultFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: LocaleKeys.email.tr(),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    DefaultFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      hintText: LocaleKeys.phone.tr(),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    DefaultFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      isPassword: RegisterCubit.get(context).showPassword,
                      hintText: LocaleKeys.password.tr(),
                      suffix: RegisterCubit.get(context).suffixIcon,
                      suffixPressed: () {
                        setState(() {
                          RegisterCubit.get(context).changeSuffixIcon(context);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    DefaultFormField(
                      controller: confirmPasswordController,
                      keyboardType: TextInputType.text,
                      isPassword: RegisterCubit.get(context).showConfirmPassword,
                      hintText: LocaleKeys.confirm_password.tr(),
                      validate: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.empty_field.tr();
                        }
                        else if (value != passwordController.text) {
                          return LocaleKeys.password_match.tr();
                        }
                        return null;
                      },
                      suffix: RegisterCubit.get(context).confirmSuffixIcon,
                      suffixPressed: () {
                        setState(() {
                          RegisterCubit.get(context)
                              .changeConfirmSuffixIcon(context);
                        });
                      },
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
                        if (loginFormKey.currentState!.validate()) {
                          RegisterCubit.get(context).userRegister(
                              email: emailController.text,
                              password: passwordController.text,
                              phone: phoneController.text,
                              name: nameController.text);
                        }
                      },
                    ),
                    Spacer(),
                    DefaultButton(
                      text: LocaleKeys.login.tr(),
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/login', (route) => false);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
