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
          DrawerButton(
            icon: const Icon(Icons.upcoming_sharp),
            onPressed: () {},
            label: 'Upgrade to Premium',
          ),
          DrawerButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
            label: 'Share with Friends',
          ),
          DrawerButton(
            icon: const Icon(Icons.backup),
            onPressed: () {},
            label: 'Backup',
          ),
          DrawerButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  final String label;
  final Icon icon;
  final Function onPressed;
  const DrawerButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed,
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
}
