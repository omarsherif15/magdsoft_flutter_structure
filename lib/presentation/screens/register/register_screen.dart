import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/register_cubit/register_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_Form_Field.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_button.dart';

import '../../../i18n/local_keys.g.dart';
import '../../widget/toast.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create:(context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if(state is RegisterSuccessfulState){
              showToast(state.registerResponse.message);
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (route) => false);
            }
            else  if(state is RegisterErrorState)
            {
              showToast(state.registerResponse.message);
            }
            else  if(state is RegisterLoadingState)
            {
              showToast(LocaleKeys.loading.tr());
            }
          },
          builder: (context, state){
            return Scaffold(
              backgroundColor: AppColor.blue,
              extendBodyBehindAppBar: true,
              extendBody: true,
              body: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    color: AppColor.blue,
                    padding: const EdgeInsetsDirectional.only(top: 30),
                    alignment: Alignment.topCenter,
                    child: const Image(image: AssetImage('assets/images/logo.png')),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height*2/3,
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
                          children:
                          [
                            Padding(
                              padding: const EdgeInsets.all(40),
                              child: Column(
                                children: [
                                  DefaultFormField(
                                      context: context,
                                      controller: nameController,
                                      keyboardType: TextInputType.text,
                                      hintText: LocaleKeys.name.tr(),
                                      validate: (value)
                                      {
                                        if(value!.isEmpty) {
                                          return LocaleKeys.empty_field.tr();
                                        }
                                      }
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  DefaultFormField(
                                    context: context,
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    hintText: LocaleKeys.email.tr(),
                                    validate: (value)
                                    {
                                      if(value!.isEmpty) {
                                        return LocaleKeys.empty_field.tr();
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  DefaultFormField(
                                    context: context,
                                    controller: phoneController,
                                    keyboardType: TextInputType.phone,
                                    hintText: LocaleKeys.phone.tr(),
                                    validate: (value)
                                    {
                                      if(value!.isEmpty) {
                                        return LocaleKeys.empty_field.tr();
                                      }
                                    },
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  DefaultFormField(
                                    context: context,
                                    controller: passwordController,
                                    keyboardType: TextInputType.text,
                                    hintText: LocaleKeys.password.tr(),
                                    validate: (value)
                                    {
                                      if(value!.isEmpty) {
                                        return LocaleKeys.empty_field.tr();
                                      }
                                    },
                                    suffix: Icons.visibility_off,
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  DefaultFormField(
                                    context: context,
                                    controller: confirmPasswordController,
                                    keyboardType: TextInputType.text,
                                    hintText: LocaleKeys.confirm_password.tr(),
                                    validate: (value)
                                    {
                                      if(value!.isEmpty) {
                                          return LocaleKeys.empty_field.tr();
                                      }
                                      else if(value != passwordController.text){
                                        return LocaleKeys.password_match.tr();
                                      }
                                    },
                                    suffix: Icons.visibility_off,
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
                                            name: nameController.text
                                        );
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
                      ),
                    ),
                  ),
                ],
              ),
              // bottomSheet: Container(
              //   height: 500,
              //   width: double.infinity,
              //   padding: EdgeInsets.all(15),
              //   decoration: BoxDecoration(
              //       border: Border.all(),
              //       color: Colors.white,
              //       borderRadius: const BorderRadius.only(
              //         topRight: Radius.circular(50.0),
              //         topLeft: Radius.circular(50.0),
              //       )),
              //   child: Form(
              //     key: loginFormKey,
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children:
              //       [
              //         const SizedBox(height: 10,),
              //         DefaultFormField(
              //             context: context,
              //             controller: emailController,
              //             keyboardType: TextInputType.emailAddress,
              //             hintText: "Email",
              //             validate: (value)
              //             {
              //               if(value!.isEmpty) {
              //                 return "This Field must be filled";
              //               }
              //             }
              //         ),
              //         const SizedBox(
              //           height: 15,
              //         ),
              //         DefaultFormField(
              //           context: context,
              //           controller: emailController,
              //           keyboardType: TextInputType.emailAddress,
              //           hintText: "Password",
              //           validate: (value)
              //           {
              //             if(value!.isEmpty) {
              //               return "This Field must be filled";
              //             }
              //           },
              //           suffix: Icons.visibility_off,
              //         ),
              //         Row(
              //           children: [
              //             DefaultButton(
              //               text: 'Register',
              //               onTap: () {
              //                 // if (loginFormKey.currentState!.validate()) {
              //                 //   LoginCubit.get(context).signIn(
              //                 //     email: emailController.text,
              //                 //     password: passwordController.text,
              //                 //   );
              //                 // }
              //               },
              //             ),
              //             DefaultButton(
              //               text: 'Register',
              //               onTap: () {
              //                 // if (loginFormKey.currentState!.validate()) {
              //                 //   LoginCubit.get(context).signIn(
              //                 //     email: emailController.text,
              //                 //     password: passwordController.text,
              //                 //   );
              //                 // }
              //               },
              //             ),
              //           ],
              //         ),
              //         SizedBox(height: 20,),
              //
              //       ],
              //     ),
              //   ),
              // ),

            );
          },
      ),
      );
  }
}
