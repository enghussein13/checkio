import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

class SmartAttendanceApp extends StatefulWidget {
  @override
  _SmartAttendanceAppState createState() => _SmartAttendanceAppState();
}

class _SmartAttendanceAppState extends State<SmartAttendanceApp> {
  bool _isPresent = false;

  Future<void> _checkIn() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      // Check if the user is within the company's premises
      // For example, using Geofencing or checking against a list of authorized locations
      if (position.latitude != 29 &&
          position.longitude != 31) {
        // Record attendance in the database or file
        setState(() {
          _isPresent = true;
        });
        Fluttertoast.showToast(msg: "Attendance recorded!");
      } else {
        Fluttertoast.showToast(msg: "You are not at the office!");
      }
    } on PlatformException catch (e) {
      Fluttertoast.showToast(msg: "Error: ${e.message}");
    }
  }

  Future<void> _checkOut() async {
    // Record attendance in the database or file
    setState(() {
      _isPresent = false;
    });
    Fluttertoast.showToast(msg: "Attendance recorded!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Attendance App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Are you present?',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Switch(
              value: _isPresent,
              onChanged: (value) {
                if (value) {
                  _checkIn();
                } else {
                  _checkOut();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
