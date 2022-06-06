import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  void changeLocal(BuildContext context) async {
    if (EasyLocalization
        .of(context)
        ?.currentLocale
        ?.languageCode == 'ar') {
      await context.setLocale(Locale('en'));
      emit(ChangeLocalToEnState());
    }
    else {
      await context.setLocale(Locale('ar'));
      emit(ChangeLocalToArState());
    }
  }
}
