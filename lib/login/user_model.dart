import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  int id, pet_id;
  String name, address, phone, email, password, created_at, updated_at;
  User({required this.id, required this.name , required this.address , required this.phone, required this.email, required this.password, required this.pet_id , required this.created_at, required this.updated_at});
  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}