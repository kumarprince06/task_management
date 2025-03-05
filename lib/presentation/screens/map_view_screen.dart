import 'package:flutter/material.dart';
import 'package:task_management/presentation/widgets/card_widgets.dart';
import 'package:task_management/presentation/widgets/custom_drawer.dart';
import 'package:task_management/presentation/widgets/map_widgets.dart';

class MapViewScreen extends StatefulWidget {
  const MapViewScreen({super.key});

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenHeight * 0.022;
    double labelPaddingBottom = screenHeight * 0.015;
    double indicatorPaddingTop = screenHeight * 0.015;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Tasks',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () => _scaffoldKey.currentState?.openDrawer(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 12, 4, 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMenuLine(25),
                  const SizedBox(height: 5),
                  _buildMenuLine(15),
                  const SizedBox(height: 5),
                  _buildMenuLine(20),
                ],
              ),
            ),
          ),
          actions: [_buildPopupMenu()],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(65),
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
                labelPadding: EdgeInsets.only(bottom: labelPaddingBottom),
                indicatorPadding: EdgeInsets.only(top: indicatorPaddingTop),
                indicator: UnderlineTabIndicator(
                  borderSide: const BorderSide(width: 4, color: Colors.black),
                  insets: EdgeInsets.symmetric(horizontal: screenWidth * -0.08),
                ),
                tabs: const [
                  Tab(text: "Map View"),
                  Tab(text: "List View"),
                ],
              ),
            ),
          ),
        ),
        drawer: const CustomDrawer(),
        body: const TabBarView(
          children: [
            MapScreen(),
            CardWidgets(),
          ],
        ),
      ),
    );
  }

  /// Helper method to build menu icon lines
  Widget _buildMenuLine(double width) {
    return Container(width: width, height: 2, color: Colors.black);
  }

  /// Helper method to build the status filter dropdown
  Widget _buildPopupMenu() {
    return Theme(
      data: Theme.of(context).copyWith(popupMenuTheme: const PopupMenuThemeData(color: Colors.white)),
      child: PopupMenuButton<String>(
        onSelected: (String value) {
          setState(() {
            // Handle selection
          });
        },
        itemBuilder: (BuildContext context) => const [
          PopupMenuItem(value: "All", child: Text("All")),
          PopupMenuItem(value: "Completed", child: Text("Completed")),
          PopupMenuItem(value: "Pending", child: Text("Pending")),
          PopupMenuItem(value: "Ongoing", child: Text("Ongoing")),
        ],
        offset: const Offset(0, 30),
        child: const Padding(
          padding: EdgeInsets.only(right: 10),
          child: Row(
            children: [
              Text("All Status", style: TextStyle(color: Colors.black, fontSize: 16)),
              SizedBox(width: 5),
              Icon(Icons.arrow_drop_down, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}







