import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/network/requests/register_request.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/register_response.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);


  RegisterResponse? registerData;
  void userRegister({
  required String email,
  required String password,
  required String name,
  required String phone,
}){
    emit(RegisterLoadingState());
    DioHelper.postData(
        url: register,
        body: RegisterRequest(email: email, password: password, name: name, phone: phone).toJson()
    ).then((value) {
      registerData = RegisterResponse.fromJson(value.data);
      emit(RegisterSuccessfulState(registerData!));
    }).catchError((error){
      emit(RegisterErrorState(registerData!));
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
  }

  bool showConfirmPassword = true;
  IconData confirmSuffixIcon = Icons.visibility_off_outlined;

  void changeConfirmSuffixIcon(context) {
    showConfirmPassword = !showConfirmPassword;
    if (showConfirmPassword) {
      confirmSuffixIcon = Icons.visibility_outlined;
    } else {
      confirmSuffixIcon = Icons.visibility_off_outlined;
    }
  }
}
