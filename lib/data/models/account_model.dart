import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

// @JsonSerializable()
// class AccountModel {
//   List<Account>? account;
//
//   AccountModel({this.account});
//
//   factory AccountModel.fromJson(Map<String, dynamic> json) => _$AccountModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$AccountModelToJson(this);
// }

@JsonSerializable()
class Account {
  int? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? updatedAt;
  String? createdAt;

  Account({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.updatedAt,
    required this.createdAt,
  });

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}


