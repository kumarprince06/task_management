import 'package:flutter/material.dart';
import 'package:task_management/presentation/screens/map_view_screen.dart';
import 'package:task_management/presentation/widgets/card_widgets.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Text(
                'Task Management',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text('Map View'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MapViewScreen(initialTabIndex: 0)),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('List View'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MapViewScreen(initialTabIndex: 1)),
              );
            },
          ),
        ],
      ),
    );
  }
}