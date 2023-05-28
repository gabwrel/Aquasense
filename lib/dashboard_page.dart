import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late DatabaseReference _databaseReference;
  double? pH;

  @override
  void initState() {
    super.initState();
    _initializeFirebase();
    _listenTopH();
  }

  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    _databaseReference = FirebaseDatabase.instance.reference().child('pH');
  }

  void _listenTopH() {
    _databaseReference.onValue.listen((event) {
      final data = event.snapshot.value as double?;
      setState(() {
        pH = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        flexibleSpace: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Image.asset(
              'assets/images/logo2.png',
              height: 80,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // TODO: Implement refresh functionality
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Aquasense',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // TODO: Implement Home navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('User'),
              onTap: () {
                // TODO: Implement User navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Page'),
              onTap: () {
                // TODO: Implement About Page navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // TODO: Implement Logout functionality
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: BoxItem(
                    icon: Icons.opacity,
                    title: 'pH Level',
                    value: pH != null ? pH!.toStringAsFixed(2) : '--',
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: BoxItem(
                    icon: Icons.thermostat_outlined,
                    title: 'Temperature',
                    value: '--', // Placeholder value, replace with actual data
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: BoxItem(
                    icon: Icons.waves_outlined,
                    title: 'Water Level',
                    value: '--', // Placeholder value, replace with actual data
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Environment Controls',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: BoxItem(
                    icon: Icons.lightbulb,
                    title: 'Lighting',
                    value: '--', // Placeholder value, replace with actual data
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: BoxItem(
                    icon: Icons.restaurant,
                    title: 'Feeding',
                    value: '--', // Placeholder value, replace with actual data
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Filtration System',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: BoxItem(
                    icon: Icons.whatshot,
                    title: 'Heater',
                    value: '--', // Placeholder value, replace with actual data
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: BoxItem(
                    icon: Icons.lightbulb,
                    title: 'UV Lamp',
                    value: '--', // Placeholder value, replace with actual data
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
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
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}