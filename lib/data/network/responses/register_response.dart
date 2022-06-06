import 'package:json_annotation/json_annotation.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  int status;
  String message;

  RegisterResponse({required this.status, required this.message});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}