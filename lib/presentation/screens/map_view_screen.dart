import 'package:flutter/material.dart';
import 'package:task_management/presentation/widgets/card_widgets.dart';
import 'package:task_management/presentation/widgets/map_widgets.dart';

class MapViewScreen extends StatelessWidget {
  const MapViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.sizeOf(context).height * 0.022;

    return DefaultTabController(
      length: 2, // Two tabs: Map View & List View
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Tasks',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            labelColor: Colors.black,
            // Active tab text color
            unselectedLabelColor: Colors.grey,
            // Inactive tab text color
            labelStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold, // Bold for active tab
            ),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 4,
                color: Colors.black,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              insets: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * -0.08,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            tabs: const [
              Tab(text: "Map View"),
              Tab(text: "List View"),
            ],
          ),
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
                leading: const Icon(Icons.map),
                title: const Text('Map View'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.list),
                title: const Text('List View'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MapScreen(), // Your map widget
            CardWidgets()
          ],
        ),
      ),
    );
  }
}
