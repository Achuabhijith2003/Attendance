import 'package:attendance/home.dart';
import 'package:attendance/setup.dart';
import 'package:flutter/material.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: const Text("Settings"),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 75,
                width: 500,
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
                child: Padding(
                    padding: const EdgeInsets.only(right: 200),
                    child: TextButton.icon(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const setup1()));
                      },
                      label: const Text(
                        "Add Sub",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 75,
                width: 500,
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
                child: Padding(
                    padding: const EdgeInsets.only(right: 200),
                    child: TextButton.icon(
                      icon: const Icon(
                        Icons.settings_backup_restore_sharp,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const home()));
                      },
                      label: const Text(
                        "Reset",
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ),
                    )),
              ),
            ),
          ],
        ));
  }
}
