// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vaccine _$VaccineFromJson(Map<String, dynamic> json) => Vaccine(
      name: json['name'] as String,
      week_no: json['week_no'] as int,
      id: json['id'] as int,
      description: json['description'] as String,
    );

Map<String, dynamic> _$VaccineToJson(Vaccine instance) => <String, dynamic>{
      'id': instance.id,
      'week_no': instance.week_no,
      'name': instance.name,
      'description': instance.description,
    };
