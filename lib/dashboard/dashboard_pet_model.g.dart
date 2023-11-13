// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_pet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardPet _$DashboardPetFromJson(Map<String, dynamic> json) => DashboardPet(
      microchip: json['microchip'] as int,
      breed: json['breed'] as String,
      name: json['name'] as String,
      dob: json['dob'] as String,
      color: json['color'] as String,
      created_at: json['created_at'] as String,
      owner_id: json['owner_id'] as int,
      age: json['age'] as int,
      updated_at: json['updated_at'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$DashboardPetToJson(DashboardPet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'age': instance.age,
      'microchip': instance.microchip,
      'owner_id': instance.owner_id,
      'name': instance.name,
      'breed': instance.breed,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'color': instance.color,
      'dob': instance.dob,
    };
