import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class PreLogin{
  String email, password;
  PreLogin({required this.email, required this.password});

  factory PreLogin.fromJSON(Map<String,dynamic> data) => _$PreLoginFromJson(data);

  Map<String, dynamic> toJSON() => _$PreLoginToJson(this);
}