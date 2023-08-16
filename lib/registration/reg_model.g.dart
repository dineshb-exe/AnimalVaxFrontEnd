// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reg_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      name: json['name'] as String,
      address: json['address'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    )..pet_id = json['pet_id'] as String;

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'password': instance.password,
      'phone': instance.phone,
      'email': instance.email,
      'pet_id': instance.pet_id,
    };
