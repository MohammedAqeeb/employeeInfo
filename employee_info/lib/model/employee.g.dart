// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      eName: json['eName'] as String? ?? '',
      email: json['email'] as String? ?? '',
      eId: json['eId'] as String? ?? '',
      department: json['department'] as String? ?? '',
      designation: json['designation'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      doj: Employee.timestampToDateTime(json['doj'] as Timestamp?),
      isActive: json['isActive'] as bool? ?? false,
    );
