import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class Login{
  String email, password;
  Login({required this.email, required this.password});

  factory Login.fromJSON(Map<String,dynamic> data) => _$LoginFromJson(data);

  Map<String, dynamic> toJSON() => _$LoginToJson(this);
}