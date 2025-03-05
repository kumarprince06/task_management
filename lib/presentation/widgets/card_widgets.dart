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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleColor,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: _isTapped ? Colors.blueAccent : Colors.white,
        child: SizedBox(
          width: 200,
          height: 100,
          child: Center(
            child: Text(
              _isTapped ? "Tapped!" : "Tap me",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
