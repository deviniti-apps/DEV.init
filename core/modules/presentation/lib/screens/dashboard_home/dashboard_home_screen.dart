import 'package:flutter/material.dart';

class DashboardHomeScreen extends StatelessWidget {
  static const routeName = '/dashboard-home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home'),
          ],
        ),
      ),
    );
  }
}
