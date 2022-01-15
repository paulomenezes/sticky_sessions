import 'package:flutter/material.dart';
import 'package:sticky_sessions/utils/constants.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Image(
                  image: AssetImage("assets/profile.png"),
                  width: 80,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Paulo Menezes",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 6,
                ),
                Text("paulo.hgmenezes@gmail.com")
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.coffee,
                  color: primaryColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Meetings',
                  style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
                )
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.info,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'About',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                )
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(Icons.settings, color: Colors.grey),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Settings',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                )
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          const Spacer(),
          ListTile(
            title: Row(
              children: const [
                Icon(Icons.logout, color: primaryColor),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Logout',
                  style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
                )
              ],
            ),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(context, routerLogin, (route) => false);
            },
          ),
          const ListTile(
            title: Text("v 0.0.1"),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
