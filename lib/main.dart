import 'package:flutter/material.dart';
import 'package:aquasense/dashboard_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primaryColor: Colors.white, // Set the primary color to white
        appBarTheme: AppBarTheme(
          color: Colors.white, // Set the AppBar color to white
          iconTheme:
              IconThemeData(color: Colors.blue), // Set the icon color to black
        ),
      ),
      home: DashboardPage(), // Set the DashboardPage as the initial screen
    );
  }
}
