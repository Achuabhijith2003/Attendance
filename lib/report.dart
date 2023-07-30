import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class reports extends StatefulWidget {
  const reports({super.key});

  @override
  State<reports> createState() => _reportState();
}

class _reportState extends State<reports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Report"),
      ),
    );
  }
}
