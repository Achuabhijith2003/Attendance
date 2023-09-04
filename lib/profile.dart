import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

import 'db/functions/db_report.dart';
import 'db/model/data_report.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();

  static frommap(map) {}
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("Profile"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Row(children: [
              const Expanded(
                flex: 2,
                child: ProfilePicture(
                  name: 'Abhijjith JR',
                  role: 'ADMINISTRATOR',
                  radius: 50,
                  fontsize: 21,
                  tooltip: true,
                ),
              ),
              Expanded(
                  //detali_space
                  flex: 3,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 139),
                        child: Column(
                          children: const [
                            Text("NAME: \n"),
                            Text("E-mail: \n")
                          ],
                        ),
                      ),
                    ],
                  ))
            ]),
          ),
          Expanded(
            // final_report_space
            flex: 2,
            child: ValueListenableBuilder(
              valueListenable: studentlistnotifier,
              builder:
                  (BuildContext ctx, List<report> attendance, Widget? child) {
                return RefreshIndicator(
                    onRefresh: () => display(),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final data = attendance[index];
                          return Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 100,
                                  width: 500,
                                  decoration: BoxDecoration(
                                    color: Colors.brown,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: const [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 221, 183, 170),
                                        blurRadius: 4,
                                        offset: Offset(4, 8), // Shadow position
                                        //dashbord decoration-end----------------------------
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 10),
                                        child: Text(
                                          data.subname,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                              fontSize: 23,
                                              color: Colors.white),
                                        ),
                                      ),
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 20, left: 10),
                                        child: Text(
                                          "%",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: attendance.length));
              },
            ),
          )
        ],
      ),
    );
  }
}
