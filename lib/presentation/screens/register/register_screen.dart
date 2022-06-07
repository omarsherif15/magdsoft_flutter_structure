import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/register_cubit/register_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/register_form.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_Form_Field.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_button.dart';

import '../../../i18n/local_keys.g.dart';
import '../../widget/toast.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

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
                  RegisterForm()
                ],
              ),
            );
          },
      ),
      );
  }
}
