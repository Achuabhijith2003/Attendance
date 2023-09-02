import 'package:attendance/db/functions/db_report.dart';
import 'package:attendance/db/model/data_report.dart';
import 'package:flutter/material.dart';

class setup1 extends StatefulWidget {
  const setup1({super.key});

  @override
  State<setup1> createState() => _setup1State();
}

final subname = TextEditingController();

class _setup1State extends State<setup1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("Setup(1/2)"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const setup2(),
        )),
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.brown,
        ),
      ),
      body: Column(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: subname,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown)),
                    hintText: 'Sub_name'),
              ),
            ),
          ],
        ),
        Container(
          color: Colors.blue,
          child: Column(children: [monthssele()]),
        ),
        Column(
          children: [
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.brown)),
                onPressed: () {
                  getsubname();
                  display();
                  setState(() {});
                },
                icon: const Icon(Icons.add),
                label: const Text("Add")),
          ],
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: studentlistnotifier,
            builder:
                (BuildContext ctx, List<report> attendance, Widget? child) {
              return RefreshIndicator(
                onRefresh: () => display(),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      final data = attendance[index];
                      return ListTile(
                        title: Text(data.subname),
                        subtitle: Text(""),
                        onTap: () {},
                        trailing: IconButton(
                            onPressed: () {
                              debugPrint("delete");
                              delsubname(data.subname);
                            },
                            icon: const Icon(Icons.delete)),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: attendance.length),
              );
            },
          ),
        )
      ]),
    );
  }
}

TextEditingController _datecontroller = new TextEditingController();

Future<void> getsubname() async {
  final Subname = subname.text.trim();
  if (Subname.isEmpty) {
    return;
  } else {
    addsubname(report(subname: Subname));
  }
}

Future<void> delsubname(Subname) async {
  deletesubname(report(subname: Subname));
}

class setup2 extends StatefulWidget {
  const setup2({super.key});

  @override
  State<setup2> createState() => _setup2State();
}

/// Flutter code sample for [DropdownButton].

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class monthssele extends StatefulWidget {
  const monthssele({super.key});

  @override
  State<monthssele> createState() => monthsseleState();
}

class monthsseleState extends State<monthssele> {
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

//---------------------------------------------------------------------------------------------------------------------------------

class _setup2State extends State<setup2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("Setup(2/2)"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushReplacementNamed('home'),
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.brown,
        ),
      ),
    );
  }
}
