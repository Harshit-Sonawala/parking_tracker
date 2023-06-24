import 'package:flutter/material.dart';

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
        fontFamily: 'Inter',
        useMaterial3: true,
        primaryColor: Colors.lightBlue,
        scaffoldBackgroundColor: const Color(0xfff4f4f4),
      ),
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Parking Tracker',
              style: TextStyle(
                fontSize: 32,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  color: Colors.deepOrange,
                  child: InkWell(
                    onTap: () => {},
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.admin_panel_settings,
                            color: Colors.white,
                            size: 54,
                          ),
                          Text(
                            'Login as an Admin',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.lightBlue,
                  child: InkWell(
                    onTap: () => {},
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.account_circle,
                            color: Colors.white,
                            size: 54,
                          ),
                          Text(
                            'Check as a Guest',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
