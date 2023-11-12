// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doc_reg_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
      name: json['name'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      hospital_address: json['hospital_address'] as String,
    );

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'email': instance.email,
      'password': instance.password,
      'hospital_address': instance.hospital_address,
      'phone': instance.phone,
    };
