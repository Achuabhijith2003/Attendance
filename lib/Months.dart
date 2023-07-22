import 'package:attendance/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Months extends StatefulWidget {
  const Months({super.key});

  @override
  State<Months> createState() => _MonthsState();
}

class _MonthsState extends State<Months> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sidebar(),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Months"),
      ),
    );
  }
}
