import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final List<BoxItemData> boxItems = [
    BoxItemData(
      icon: Icons.opacity,
      title: 'Water Level',
    ),
    BoxItemData(
      icon: Icons.waves,
      title: 'Water Turbidity',
    ),
    BoxItemData(
      icon: Icons.show_chart,
      title: 'pH Levels',
    ),
    BoxItemData(
      icon: Icons.thermostat_outlined,
      title: 'Temperature',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // TODO: Implement navigation drawer functionality
          },
        ),
        flexibleSpace: Align(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/logo2.png',
            height: 80,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // TODO: Implement refresh functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DASHBOARD',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Water Parameters',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.2, // Adjust the aspect ratio as desired
                children: boxItems.map((boxItem) {
                  return FractionallySizedBox(
                    widthFactor: 0.9, // Adjust the width factor as desired
                    child: BoxItem(
                      icon: boxItem.icon,
                      title: boxItem.title,
                      value:
                          '--', // Placeholder value, replace with actual data
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BoxItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const BoxItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 24),
            SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Text(
              value,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class BoxItemData {
  final IconData icon;
  final String title;

  BoxItemData({
    required this.icon,
    required this.title,
  });
}
