import 'package:json_annotation/json_annotation.dart';

part 'vaccine_model.g.dart';

@JsonSerializable()
class Vaccine {
  int id, week_no;
  String name, description;
  Vaccine({required this.name, required this.week_no, required this.id, required this.description});
  factory Vaccine.fromJson(Map<String, dynamic> data) => _$VaccineFromJson(data);
  Map<String, dynamic> toJson() => _$VaccineToJson(this);
}