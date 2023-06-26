import 'dart:ui';

import 'package:flutter/material.dart';
import './home_screen.dart';

void main() {
  runApp(const ParkingTracker());
}

class ParkingTracker extends StatefulWidget {
  const ParkingTracker({super.key});

  @override
  State<ParkingTracker> createState() => _ParkingTrackerState();
}

class _ParkingTrackerState extends State<ParkingTracker> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parking Tracker',
      theme: ThemeData(
        // fontFamily: 'Inter',
        useMaterial3: true,
        primaryColor: Colors.lightBlue,
        scaffoldBackgroundColor: Color(0xFFf0f0f0),
        cardTheme: const CardTheme(elevation: 0, color: Colors.white),
      ),
      home: const HomeScreen(),
    );
  }
}
