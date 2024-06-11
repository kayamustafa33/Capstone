import 'package:flutter/material.dart';

class Competition {
  int competitionId;
  String competitionName;
  String competitionStyle;
  DateTime competitionDate;
  String location;
  TimeOfDay startTime;
  TimeOfDay endTime;

  Competition({
    required this.competitionId,
    required this.competitionName,
    required this.competitionStyle,
    required this.competitionDate,
    required this.location,
    required this.startTime,
    required this.endTime,
  });

  factory Competition.fromMap(Map<dynamic, dynamic> map) {
    return Competition(
      competitionId: map['competition_id'],
      competitionName: map['competition_name'],
      competitionStyle: map['competition_style'],
      competitionDate: DateTime.parse(map['competition_date'].toString()),
      location: map['location'],
      startTime: _parseTime(map['startTime'].toString()),
      endTime: _parseTime(map['endTime'].toString()),
    );
  }

  static TimeOfDay _parseTime(String time) {
    final parts = time.split(':');
    final hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);
    return TimeOfDay(hour: hour, minute: minute);
  }
}
