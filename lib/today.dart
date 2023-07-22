import 'package:attendance/sidebar.dart';
import 'package:flutter/material.dart';

class Today extends StatefulWidget {
  const Today({super.key});

  @override
  State<Today> createState() => _TodayState();
}

class _TodayState extends State<Today> {
  String Status = "";
  int n = 0;
  // String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const sidebar(),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("Today"),
      ),
      floatingActionButton: floatingbox(),
      body: Container(
        child: box(),
      ),
    );
  }

  floatingbox() {
    //floating_button function
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("sub_name"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    const Center(
                      child: DropdownButtonExample(),
                    ),
                    TextButton(
                        //present button start
                        onPressed: () {
                          Navigator.of(context).pop();
                          debugPrint("Present");
                          //debugPrint(dropdownValue);
                          n++;
                          Status = "Present";
                          setState(() {});
                        },
                        child: const Text(
                          "Present",
                          style: TextStyle(color: Colors.green),
                        )),
                    TextButton(
                        //Absent button start
                        onPressed: () {
                          Navigator.of(context).pop();
                          debugPrint("Absent");
                          Status = "Absent";
                          //  debugPrint(dropdownValue);
                          n++;
                          setState(() {});
                        },
                        child: const Text(
                          "Abesent",
                          style: TextStyle(color: Colors.red),
                        ))
                  ],
                ),
              ),
            );
          },
        );
      },
      backgroundColor: Colors.white,
      child: const Icon(
        Icons.add,
        color: Colors.brown,
      ),
    );
  }

  box() {
    //box_function
    
    return ListView.separated(
        itemBuilder: (context, Stauts) {
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
                        color: Color.fromARGB(255, 221, 183, 170),
                        blurRadius: 4,
                        offset: Offset(4, 8), // Shadow position
                        //dashbord decoration-end----------------------------
                      ),
                    ],
                  ),
                  child: Text(
                    Status,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: n);
  }
}

/// Flutter code sample for [DropdownButton].

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.brown,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
