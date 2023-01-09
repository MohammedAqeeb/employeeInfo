import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable(createToJson: false)
class Employee {
  @JsonKey(defaultValue: '')
  final String eName, email, eId, department, designation, phoneNumber;

  @JsonKey(fromJson: timestampToDateTime)
  final DateTime? doj;

  @JsonKey(defaultValue: false)
  final bool isActive;

  const Employee({
    required this.eName,
    required this.email,
    required this.eId,
    required this.department,
    required this.designation,
    required this.phoneNumber,
    this.doj,
    required this.isActive,
  });

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  static DateTime? timestampToDateTime(Timestamp? timestamp) =>
      timestamp?.toDate();
}
