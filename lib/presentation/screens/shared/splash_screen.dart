import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/splash_cubit/splash_cubit.dart';
import '../../styles/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (_) => SplashCubit()..startTimer(),
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashDone) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/login', (route) => false);
          }
        },
        builder: (context, state) {
          return Container(
            color: AppColor.blue,
            padding: const EdgeInsetsDirectional.only(top: 30),
            child: Image(image: AssetImage('assets/images/logo.png')),
          );
        },
      ),
    );
  }
}
