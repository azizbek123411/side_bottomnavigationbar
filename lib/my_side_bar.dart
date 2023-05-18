import 'package:flutter/material.dart';

class MySideBar extends StatelessWidget {
  const MySideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Sultonov Azizbek"),
            accountEmail: Text(
              "sultonovazizbek73@gmail.com",
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image(
                  image: AssetImage(
                    "assets/images/i4.jpg",
                  ),
                  fit: BoxFit.cover,
                  height: 90,
                  width: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/download (1).jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.people_alt_outlined,
              size: 30,
            ),
            title: const Text(
              "New Group",
              style: TextStyle(fontSize: 17),
            ),
            onTap: () {},
          ),
          ListTile(
              leading: const Icon(
                Icons.person_2_outlined,
                size: 30,
              ),
              title: const Text(
                "Contacts",
                style: TextStyle(fontSize: 17),
              ),
              onTap: () {}),
          ListTile(
              leading: const Icon(
                Icons.call,
                size: 30,
              ),
              title: const Text(
                "Calls",
                style: TextStyle(fontSize: 17),
              ),
              onTap: () {}),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 30,
            ),
            title: const Text(
              "Settings",
              style: TextStyle(fontSize: 17),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.notifications,
              size: 30,
            ),
            trailing: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.blue,
              ),
              child: const Text(
                "99+",
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: const Text(
              "Notifications",
              style: TextStyle(fontSize: 17),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
