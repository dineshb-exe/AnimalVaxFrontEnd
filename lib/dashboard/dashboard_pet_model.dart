import 'package:json_annotation/json_annotation.dart';

part 'dashboard_pet_model.g.dart';

@JsonSerializable()
class DashboardPet {
  int id, age, microchip, owner_id;
  String name, breed, created_at, updated_at, color, dob;
  DashboardPet({required this.microchip, required this.breed, required this.name, required this.dob, required this.color, required this.created_at, required this.owner_id, required this.age, required this.updated_at, required this.id});
  factory DashboardPet.fromJson(Map<String, dynamic> data) => _$DashboardPetFromJson(data);
  Map<String, dynamic> toJson() => _$DashboardPetToJson(this);
}