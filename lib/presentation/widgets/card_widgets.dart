import 'package:flutter/material.dart';

class CardWidgets extends StatefulWidget {
  const CardWidgets({super.key});

  @override
  State<CardWidgets> createState() => _CardWidgetsState();
}

class _CardWidgetsState extends State<CardWidgets> {
  bool _isTapped = false;

  void _toggleColor() {
    setState(() {
      _isTapped = !_isTapped;
    });
  }

  final List<Map<String, dynamic>> tasks = [
    {
      "id": "T001",
      "description": "Deliver package to John",
      "latitude": 37.7749,
      "longitude": -122.4194,
      "date": "2025-03-05",
      "time": "10:00 AM"
    },
    {
      "id": "T002",
      "description": "Pickup documents from Sarah",
      "latitude": 40.7128,
      "longitude": -74.0060,
      "date": "2025-03-06",
      "time": "2:30 PM"
    },
    {
      "id": "T003",
      "description": "Meet client at coffee shop",
      "latitude": 34.0522,
      "longitude": -118.2437,
      "date": "2025-03-07",
      "time": "4:45 PM"
    },
    {
      "id": "T004",
      "description": "Meet client at coffee shop",
      "latitude": 34.0522,
      "longitude": -118.2437,
      "date": "2025-03-07",
      "time": "4:45 PM"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return GestureDetector(
          onTap: _toggleColor,
          child: Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01, horizontal: screenWidth * 0.05),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: _isTapped ? Colors.blueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTaskDetail("Task ID:", task['id'], screenWidth),
                  _buildTaskDetail("Description:", task['description'], screenWidth),
                  _buildTaskDetail("Latitude:", task['latitude'].toString(), screenWidth),
                  _buildTaskDetail("Longitude:", task['longitude'].toString(), screenWidth),
                  _buildTaskDetail("Date:", task['date'], screenWidth),
                  _buildTaskDetail("Time:", task['time'], screenWidth),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Helper method to create task detail row with label and value
  Widget _buildTaskDetail(String label, String value, double screenWidth) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenWidth * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: screenWidth * 0.25, // Label width
            child: Text(label,
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: Text(value,
                style: const TextStyle(
                  fontSize: 14,
                )),
          ),
        ],
      ),
    );
  }
}
