import 'package:json_annotation/json_annotation.dart';

part 'hospital_model.g.dart';

@JsonSerializable()
class Hospital {
  int id;
  String hospital_name, hospital_address, hospital_phone, email, created_at, updated_at;
  Hospital({required this.updated_at, required this.created_at, required this.email, required this.hospital_address, required this.hospital_name, required this.hospital_phone, required this.id});
  factory Hospital.fromJson(Map<String, dynamic> data) => _$HospitalFromJson(data);
  Map<String, dynamic> toJson() => _$HospitalToJson(this);
}