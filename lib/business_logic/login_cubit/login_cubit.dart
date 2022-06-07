import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/login_request.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);


  LoginResponse? loginData;
  void userLogin({
  required String email,
  required String password,
}){
    emit(LoginLoadingState());
    DioHelper.postData(
        url: login,
        body: LoginRequest(email: email, password: password).toJson()
    ).then((value) {
      loginData = LoginResponse.fromJson(value.data);
      emit(LoginSuccessfulState(loginData!));
    }).catchError((error){
      emit(LoginErrorState(loginData!));
      debugPrint(error.toString());
    });
}

  bool showPassword = true;
  IconData suffixIcon = Icons.visibility_off_outlined;

  void changeSuffixIcon(context) {
    showPassword = !showPassword;
    if (showPassword) {
      suffixIcon = Icons.visibility_outlined;
    } else {
      suffixIcon = Icons.visibility_off_outlined;
    }
    emit(VisibilityChanged());
  }
}
