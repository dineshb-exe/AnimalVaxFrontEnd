import 'package:json_annotation/json_annotation.dart';

part 'doc_reg_model.g.dart';

@JsonSerializable()
class Doctor {
  String name, address, email, password, hospital_address, phone;
  Doctor({required this.name, required this.phone, required this.address, required this.password, required this.email, required this.hospital_address});

  factory Doctor.fromJson(Map<String, dynamic> data) => _$DoctorFromJson(data);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
}