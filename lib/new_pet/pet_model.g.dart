// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pet _$PetFromJson(Map<String, dynamic> json) => Pet(
      name: json['name'] as String,
      breed: json['breed'] as String,
      age: json['age'] as int,
      owner_id: json['owner_id'] as int,
      microchip: json['microchip'] as int,
      color: json['color'] as String,
      sex: json['sex'] as String,
      dob: json['dob'] as String,
      species: json['species'] as String,
    );

Map<String, dynamic> _$PetToJson(Pet instance) => <String, dynamic>{
      'owner_id': instance.owner_id,
      'age': instance.age,
      'microchip': instance.microchip,
      'name': instance.name,
      'breed': instance.breed,
      'color': instance.color,
      'sex': instance.sex,
      'dob': instance.dob,
      'species': instance.species,
    };
