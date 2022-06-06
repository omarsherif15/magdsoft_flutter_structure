import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/business_logic/login_cubit/login_cubit.dart';
import 'package:magdsoft_flutter_structure/i18n/local_keys.g.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_Form_Field.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var loginFormKey = GlobalKey<FormState>();

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
                                  context: context,
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  hintText: LocaleKeys.email.tr(),
                                  validate: (value)
                                  {
                                    if(value!.isEmpty) {
                                      return  LocaleKeys.empty_field.tr();
                                    }
                                  }
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              DefaultFormField(
                                context: context,
                                controller: passwordController,
                                keyboardType: TextInputType.emailAddress,
                                hintText: LocaleKeys.password.tr(),
                                validate: (value)
                                {
                                  if(value!.isEmpty) {
                                    return LocaleKeys.empty_field.tr();
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