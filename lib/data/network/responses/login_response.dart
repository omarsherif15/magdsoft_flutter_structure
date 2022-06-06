import 'package:json_annotation/json_annotation.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  int status;
  List<Account> account;

  LoginResponse({required this.status, required this.account});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}