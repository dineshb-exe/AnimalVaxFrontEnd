import 'package:json_annotation/json_annotation.dart';

part 'pet_model.g.dart';

@JsonSerializable()
class Pet {
  int owner_id, age, microchip;
  String name, breed, color, sex, dob, species;
  Pet({required this.name, required this.breed, required this.age, required this.owner_id, required this.microchip, required this.color, required this.sex, required this.dob, required this.species});
  factory Pet.fromJson(Map<String, dynamic> data) => _$PetFromJson(data);
  Map<String, dynamic> toJson() => _$PetToJson(this);
}