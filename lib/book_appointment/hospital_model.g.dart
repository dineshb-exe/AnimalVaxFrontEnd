// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hospital _$HospitalFromJson(Map<String, dynamic> json) => Hospital(
      updated_at: json['updated_at'] as String,
      created_at: json['created_at'] as String,
      email: json['email'] as String,
      hospital_address: json['hospital_address'] as String,
      hospital_name: json['hospital_name'] as String,
      hospital_phone: json['hospital_phone'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$HospitalToJson(Hospital instance) => <String, dynamic>{
      'id': instance.id,
      'hospital_name': instance.hospital_name,
      'hospital_address': instance.hospital_address,
      'hospital_phone': instance.hospital_phone,
      'email': instance.email,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
