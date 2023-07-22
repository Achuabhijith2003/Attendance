import 'home.dart';
import 'package:flutter/material.dart';

class suboverall extends StatefulWidget {
  final String sub_name1;

  const suboverall({super.key, required this.sub_name1});

  @override
  State<suboverall> createState() => suboverallState();
}

class suboverallState extends State<suboverall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          AppBar(backgroundColor: Colors.brown, title: Text(widget.sub_name1)),
    );
  }
}
