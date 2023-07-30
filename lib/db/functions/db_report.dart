import 'package:attendance/db/model/data_report.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<report>> studentlistnotifier = ValueNotifier([]);

late Database db;
Future<void> startdb() async {
  db = await openDatabase('Attendance.db', version: 1,
      onCreate: (db, version) async {
    await db.execute("CREATE TABLE subname (subname TEXT,date TEXT)");
  });
}

Future<void> display() async {
  final values = await db.rawQuery("SELECT * FROM subname");
  studentlistnotifier.value.clear();
  values.forEach((map) {
    final stu = report.frommap(map);
    studentlistnotifier.value.add(stu);
    studentlistnotifier.notifyListeners();
  });
  print(values);
}

//-----------------------------------------------------------------------------------
//---------------------------------------------subject_name------------------
//-----------------Add subject_name
Future<void> addsubname(report value) async {
  await db
      .rawInsert('INSERT INTO subname (subname) VALUES(?)', [value.subname]);
  studentlistnotifier.value.clear();
  studentlistnotifier.notifyListeners();
  display();
}

//-----------------Del subject_name
Future<void> deletesubname(report value) async {
  await db.rawQuery("DELETE FROM subname WHERE subname=?", [value.subname]);
  studentlistnotifier.value.clear();
  studentlistnotifier.notifyListeners();
  display();
}

//---------------------------------------------------------------------------------------------//
//----------------------------------Date-------------------------------
//------ADD Date
