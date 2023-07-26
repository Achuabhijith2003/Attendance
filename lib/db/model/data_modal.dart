import 'package:flutter/material.dart';

class Attendance {
  late final int present;
  late final int absent;
  late final String date;

  late final String subname;

  Attendance(
      {required this.subname,
      required this.absent,
      required this.date,
      required this.present});

  static Attendance frommap(Map<String, Object?> map) {
    final present = map['present'] as int;
    final absent = map['absent'] as int;
    final date = map['date'] as String;
    final subname = map['subname'] as String;
    return Attendance(
        subname: subname, absent: absent, date: date, present: present);
  }
}
