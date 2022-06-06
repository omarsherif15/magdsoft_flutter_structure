import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_states.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  static SplashCubit get(context) => BlocProvider.of(context);

  void startTimer() async {
    emit(SplashLoading());
    await Future.delayed(const Duration(seconds: 2))
        .whenComplete(() => emit(SplashDone()));
  }
}