import 'package:attendance/db/functions/db_profile.dart';
import 'package:attendance/db/functions/db_report.dart';

import 'package:attendance/setup.dart';
import 'package:attendance/sidebar.dart';

import 'package:attendance/suboverall.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    // showtables();
    display();
    profiledisplay();
    return Scaffold(
      drawer: const sidebar(),
      backgroundColor: const Color.fromARGB(255, 248, 247, 246),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("Attendance"),
      ),
      body: Column(
        //dashboard decoration-----------
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: 500,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 221, 183, 170),
                        blurRadius: 4,
                        offset: Offset(4, 8), // Shadow position
                        //dashbord decoration-end----------------------------
                      ),
                    ],
                  ),
                  child: Column(
                    //--------------------------------inside_the_dashbord-------------
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Dashboard",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 160),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => setup1(),
                                  ));
                                  print("Arrow_forward");
                                },
                                icon: Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(
                              "Summary",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ], //------------------------outside_the_dashbord----------
                  ),
                ),
              )),
          Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 30,
                      children: [
                        sub(
                          "sub_name",
                          5,
                          Colors.white,
                        ),
                        sub("sub_name1", 75, Colors.white),
                        sub("sub_name2", 45, Colors.white),
                        sub("sub_name3", 95, Colors.white),
                        sub("sub_name", 95, Colors.white),
                        sub("sub_name", 65, Colors.white),
                        sub("sub_name", 85, Colors.white),
                        sub("sub_name", 75, Colors.white),
                        sub("sub_name", 35, Colors.white),
                        sub("sub_name", 65, Colors.white),
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  sub(String title, int percentage, Color background) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.brown,
                spreadRadius: 2,
                blurRadius: 5)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
                //  borderRadius: BorderRadius.circular(10)
              ),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return suboverall(sub_name1: title);
                      },
                    ));
                    print(title);
                  },
                  child: Text(
                    "$percentage%",
                    style: TextStyle(fontSize: 15, color: Colors.brown),
                  ))),
          const SizedBox(
            height: 8,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return suboverall(sub_name1: title);
                },
              ));
              debugPrint(title);
            },
            child: Text(
              title,
              style: TextStyle(fontSize: 17, color: Colors.white70),
            ),
          )
        ],
      ),
    );
  }
}
