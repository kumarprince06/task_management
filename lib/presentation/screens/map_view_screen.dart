import 'package:flutter/material.dart';
import 'package:task_management/presentation/widgets/card_widgets.dart';
import 'package:task_management/presentation/widgets/custom_drawer.dart';
import 'package:task_management/presentation/widgets/map_widgets.dart';

class MapViewScreen extends StatefulWidget {
  final int initialTabIndex;

  const MapViewScreen({super.key, this.initialTabIndex = 0});

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 2, vsync: this, initialIndex: widget.initialTabIndex);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenHeight * 0.022;
    double labelPaddingBottom = screenHeight * 0.015;
    double indicatorPaddingTop = screenHeight * 0.015;
    double menuIconPadding = screenWidth * 0.05;

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
            onTap: () {
              if (_scaffoldKey.currentState != null) {
                _scaffoldKey.currentState!.openDrawer();
              }
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  menuIconPadding,
                  screenHeight * 0.015,
                  screenWidth * 0.01,
                  screenHeight * 0.015),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMenuLine(screenWidth * 0.06),
                  SizedBox(height: screenHeight * 0.006),
                  _buildMenuLine(screenWidth * 0.04),
                  SizedBox(height: screenHeight * 0.006),
                  _buildMenuLine(screenWidth * 0.05),
                ],
              ),
            ),
          ),
          actions: [_buildPopupMenu()],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(screenHeight * 0.08),
            child: Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.01),
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
                labelPadding: EdgeInsets.only(bottom: labelPaddingBottom),
                indicatorPadding: EdgeInsets.only(top: indicatorPaddingTop),
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                      width: screenWidth * 0.011, color: Colors.black),
                  insets: EdgeInsets.symmetric(horizontal: screenWidth * -0.09),
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
        body: TabBarView(
          controller: _tabController,
          physics:
              const NeverScrollableScrollPhysics(), // Disables swipe gestures
          children: const [
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
      data: Theme.of(context).copyWith(
          popupMenuTheme: const PopupMenuThemeData(color: Colors.white)),
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
        offset: Offset(0, MediaQuery.sizeOf(context).width * 0.06),
        child: Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.sizeOf(context).width * 0.02),
          child: Row(
            children: [
              Text("All Status",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.sizeOf(context).width * 0.035,
                  )),
              SizedBox(width: MediaQuery.sizeOf(context).width * 0.02),
              Icon(Icons.arrow_drop_down, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }
}
