import 'package:material_ui/material_ui.dart';

import '../screens/about_screen.dart';

/// Which screen is currently showing, so the drawer can highlight it.
enum DrawerPage { home, about }

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, required this.current});

  final DrawerPage current;

  static const Color green = Color(0xFF1F6B45);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: green),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Drawer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            selected: current == DrawerPage.home,
            onTap: () {
              final navigator = Navigator.of(context);
              navigator.pop(); // close the drawer
              navigator.popUntil((route) => route.isFirst); // back to Home
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            selected: current == DrawerPage.about,
            onTap: () {
              final navigator = Navigator.of(context);
              navigator.pop(); // close the drawer first
              if (current != DrawerPage.about) {
                navigator.push(
                  MaterialPageRoute<void>(
                    builder: (context) => const AboutScreen(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
