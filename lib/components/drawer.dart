import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Text(
              'Word Board',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          drawerButton('Upgrade to Premium', const Icon(Icons.upcoming_sharp)),
          drawerButton('Share with Friends', const Icon(Icons.share)),
          drawerButton('Backup', const Icon(Icons.backup)),
          drawerButton('Settings', const Icon(Icons.settings)),
        ],
      ),
    );
  }
}

Widget drawerButton(String label, Icon icon) {
  return TextButton(
    onPressed: () {},
    child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          icon,
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
