import 'package:attendance/db/model/data_profile.dart';
import 'package:attendance/profile.dart';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import 'db_report.dart';

ValueNotifier<List<Profile>> profilelistnotifier = ValueNotifier([]);
late Database profiledb;

Future<void> startprofiledb() async {
  // Open the database and create the profile table if it doesn't exist
  profiledb = await openDatabase('Profile.db', version: 1,
      onCreate: (profiledb, version) async {
    await profiledb.execute(
        "CREATE TABLE profile (NAME TEXT,Email TEXT,coures TEXT,year TEXT)");
  });
}

Future<void> profiledisplay() async {
  final valuess = await profiledb.rawQuery("SELECT * FROM profile");
  profilelistnotifier.value.clear();

  profilelistnotifier.notifyListeners();
  print(valuess);
}

Future<void> addprofile(Profile value) async {
  // Insert the new profile into the database and update the profilelistnotifier
  await profiledb.insert('profile', {
    'name': value.name,
    'email': value.email,
    'coures': value.coures,
    'year': value.year,
  });
  profilelistnotifier.value.clear();
  profilelistnotifier.notifyListeners();
  profiledisplay();
}

Future<void> reset() async {
  // Delete a single profile from the database by its id
  await profiledb.delete('profile');
  await db.delete('subname');
}
