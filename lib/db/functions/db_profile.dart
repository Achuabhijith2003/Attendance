import 'package:attendance/db/model/data_profile.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<Profile>> profilelistnotifier = ValueNotifier([]);
late Database profiledb;
Future<void> startprofiledb() async {
  profiledb = await openDatabase('Profile.db', version: 1,
      onCreate: (db, version) async {
    await db.execute("CREATE TABLE profile (NAME TEXT,Email TEXT)");
  });
}

Future<void> profiledisplay() async {
  final values = await profiledb.rawQuery("SELECT * FROM subname");
  profilelistnotifier.value.clear();
  values.forEach((map) {
    final stu = Profile.frommap(map);
    profilelistnotifier.value.add(stu);
    profilelistnotifier.notifyListeners();
  });
  print(values);
}

Future<void> addprofile(Profile value) async {
  await profiledb.rawInsert('INSERT INTO profile (name) VALUES(?)');
  profilelistnotifier.value.clear();
  profilelistnotifier.notifyListeners();
  profiledisplay();
}
