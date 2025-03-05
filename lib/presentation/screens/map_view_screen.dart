import 'package:flutter/material.dart';

class MapViewScreen extends StatefulWidget {
  const MapViewScreen({super.key});

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Tasks',style: TextStyle(fontWeight: FontWeight.bold),
      ),
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(25, 12, 4, 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: 25, height: 2, color: Colors.black), // Largest line
                SizedBox(height: 5),
                Container(width: 15, height: 2, color: Colors.black), // Medium line
                SizedBox(height: 5),
                Container(width: 20, height: 2, color: Colors.black), // Smallest line
              ],
            ),
          ),
        ),
        actions: [
          Theme(data: Theme.of(context).copyWith(
            popupMenuTheme: PopupMenuThemeData(
              color: Colors.white
            )
          ),
        child: PopupMenuButton<String>(
            onSelected: (String value) {
              setState(() {
                // selectedFilter = value;
              });
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(value: "All", child: Text("All")),
              PopupMenuItem(value: "Completed", child: Text("Completed")),
              PopupMenuItem(value: "Pending", child: Text("Pending")),
              PopupMenuItem(value: "Overdue", child: Text("Ongoing")),
            ],
            offset: Offset(0,30),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Row(
                children: [
                  Text(
                    "All Status", // Your text
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  SizedBox(width: 5), // Space between text and icon
                  Icon(Icons.arrow_drop_down, color: Colors.black), // Inverted triangle icon
                ],
              ),
            ),
          ),
          ),
        ],


      ),
        drawer: CustomDrawer(),
      );
  }
}


class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: Center(child: Text('Task Management', style: TextStyle(fontSize: 20, color: Colors.black))),
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map View'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('List View'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
