import 'package:flutter/material.dart';

class MapViewScreen extends StatefulWidget {
  const MapViewScreen({super.key});

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Tasks'),
      ),
        drawer: Drawer(
      child: ListView(
      padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text(
              'Task Management',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map View'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('List View'),
            onTap: () {
              Navigator.pop(context);
            },
          ),

        ],
      ),
    ),
      );
  }
}

