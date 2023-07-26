import 'package:attendance/db/functions/db_functions.dart';
import 'package:attendance/db/model/data_modal.dart';
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
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.brown)),
                onPressed: () {
                  getdata();
                  getsubname();
                },
                icon: const Icon(Icons.add),
                label: const Text("Add")),
          ],
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: attendancelistnotifier,
            builder:
                (BuildContext ctx, List<Attendance> attendance, Widget? child) {
              return RefreshIndicator(
                onRefresh: () => getdata(),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      final data = attendance[index];
                      return ListTile(
                        title: Text(data.subname),
                        subtitle: Text(data.date),
                        onTap: () {},
                        trailing: IconButton(
                            onPressed: () {
                              debugPrint("delete");
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

Future<void> getsubname() async {
  final Subname = subname.text.trim();
  if (Subname.isEmpty) {
    return;
  } else {
    addsubname(Attendance(
        subname: Subname,
        absent: 0,
        date: "",
        present: 0)); //add data to database
  }
}

class setup2 extends StatefulWidget {
  const setup2({super.key});

  @override
  State<setup2> createState() => _setup2State();
}

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
