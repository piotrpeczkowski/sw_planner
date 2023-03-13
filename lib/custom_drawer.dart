import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 50,
              bottom: 20,
              left: 20,
              right: 20,
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 60,
                  child: FlutterLogo(
                    size: 70,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Text(
                    'User Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  'User email',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.task_alt),
            title: const Text('Zadania'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notes),
            title: const Text('Notatki'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text('Kalendarz'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Ustawienia'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
