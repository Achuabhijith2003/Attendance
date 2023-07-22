import 'package:attendance/db/model/data_modal.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<Attendance>> attendancelistnotifier = ValueNotifier([]);
late Database db;
Future<void> startdb() async {
  db = await openDatabase(
    'attendance.db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(//${value.subname}
          'CREATE TABLE subname (date TEXT,subname TEXT,Present INTEGER,absent INTEGER)');
    },
  );
}

Future<void> getdata() async {
  final value = await db.rawQuery('SELECT * FROM subname');
  attendancelistnotifier.value.clear();
  for (var map in value) {
    final stu = Attendance.frommap(map);
    attendancelistnotifier.value.add(stu);

    // attendancelistnotifier.notifyListeners();
  }
  print(value);
}

Future<void> addsubname(Attendance value) async {
  await db
      .rawInsert('INSERT INTO  subname (subname) VALUES(?)', [value.subname]);
  getdata();
}
