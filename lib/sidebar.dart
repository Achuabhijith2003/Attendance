import 'package:flutter/material.dart';

class sidebar extends StatelessWidget {
  const sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        UserAccountsDrawerHeader(
          accountName: const Text(
            "JR",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          accountEmail: const Text(
            "Text@text.com",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onDetailsPressed: () {
            print("Profile");
            Navigator.of(context).pushNamed('profile');
          },
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                "https://cdn.pixabay.com/photo/2017/06/13/12/54/profile-2398783_640.png",
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),
          ),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images.pexels.com/photos/949587/pexels-photo-949587.jpeg?cs=srgb&dl=background-blur-blurred-949587.jpg&fm=jpg"),
                  fit: BoxFit.cover)),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            print("Home");
            Navigator.of(context).pushNamed('home');
          },
        ),
        ListTile(
          leading: const Icon(Icons.calendar_today),
          title: const Text('Today'),
          onTap: () {
            print("Toady");
            Navigator.of(context).pushNamed('today');
          },
        ),
        ListTile(
          leading: const Icon(Icons.calendar_month),
          title: const Text('Months'),
          onTap: () {
            print("Months");
            Navigator.of(context).pushNamed('months');
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Setting'),
          onTap: () {
            print("Setting");
            Navigator.of(context).pushNamed('setting');
          },
        ),
        ListTile(
          leading: const Icon(Icons.share),
          title: const Text('Share'),
          onTap: () {
            print("Share");
          },
        ),
        ListTile(
          leading: const Icon(Icons.message),
          title: const Text('Report'),
          onTap: () {
            print("report");
            Navigator.of(context).pushNamed('report');
          },
        ),
        ListTile(
          leading: const Icon(Icons.exit_to_app),
          title: const Text('Exit'),
          onTap: () {
            print("Exit");
            Navigator.of(context).pushNamed('exit');
          },
        ),
      ]),
    );
  }
}
