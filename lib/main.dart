import 'dart:io';

import 'package:attendance/Months.dart';
import 'package:attendance/db/functions/db_functions.dart';
import 'package:attendance/home.dart';
import 'package:attendance/profile.dart';
import 'package:attendance/report.dart';
import 'package:attendance/settings.dart';
import 'package:attendance/start.dart';
import 'package:attendance/today.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await startdb();
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.brown),
      home: const start(),
      debugShowCheckedModeBanner: false,
      routes: {
        'today': (context) {
          return const Today();
        },
        'months': (context) {
          return const Months();
        },
        'setting': (context) {
          return const setting();
        },
        'report': (context) {
          return const report();
        },
        'profile': (context) {
          return const profile();
        },
        'home': (context) {
          return const home();
        },
        'exit': (context) {
          return exit(0);
        }
      },
    );
  }
}
