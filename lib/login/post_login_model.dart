import 'package:json_annotation/json_annotation.dart';

part 'post_login_model.g.dart';

@JsonSerializable()
class PostLogin{
  String jwtToken;
  PostLogin({required this.jwtToken});
  factory PostLogin.fromJSON(Map<String,dynamic> data) => _$PostLoginFromJson(data);

  Map<String, dynamic> toJSON() => _$PostLoginToJson(this);
}