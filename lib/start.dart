import 'dart:async';

import 'package:attendance/home.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class start extends StatefulWidget {
  const start({super.key});

  @override
  State<start> createState() => _startState();
}

class _startState extends State<start> {
  @override
  void initState() {
    super.initState();

    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const home(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_element

    return Scaffold(
      backgroundColor: Colors.brown,
      body: Column(
        children: const [
          Expanded(
              flex: 6,
              child: Center(
                  child: Text(
                "Attendance",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ))),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "Developed By \n         JR",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
