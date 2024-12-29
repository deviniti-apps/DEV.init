import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/screens/dashboard_home/dashboard_home_screen.dart';
import 'package:presentation/screens/dashboard_profile/dashboard_profile_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(DashboardHomeScreen.routeName)) {
      return 0;
    } else if (location.startsWith(DashboardProfileScreen.routeName)) {
      return 1;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(DashboardHomeScreen.routeName);
        break;
      case 1:
        context.go(DashboardProfileScreen.routeName);
        break;
    }
  }
}
