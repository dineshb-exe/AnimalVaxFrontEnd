
import 'package:json_annotation/json_annotation.dart';

part 'reg_model.g.dart';

@JsonSerializable()
class Owner{
  String name, address, password, phone, email;
  String pet_id="123456789";
  Owner({required this.name, required this.address, required this.password, required this.email, required this.phone});

  factory Owner.fromJSON(Map<String,dynamic> data) => _$OwnerFromJson(data);

  Map<String, dynamic> toJSON() => _$OwnerToJson(this);
}