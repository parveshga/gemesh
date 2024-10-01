import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemesh/Constants/color_constant.dart';
import 'package:gemesh/Screens/Main_Screens/device_screen.dart';
import 'package:gemesh/Screens/Main_Screens/home_screen.dart';
import 'package:gemesh/Screens/Main_Screens/notification_screen.dart';
import 'package:gemesh/Screens/Main_Screens/schedule_screen.dart';
import 'package:gemesh/Screens/Main_Screens/settings_screen.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const ScheduleScreen(),
    const DeviceScreen(),
    const NotificationScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.easeOutExpo,
        backgroundColor: AppColors.whiteBackground,
        color: AppColors.primary,
        items: const [
          Icon(
            CupertinoIcons.home,
            size: 30,
            color: AppColors.whiteBackground,
          ),
          Icon(
            CupertinoIcons.calendar,
            size: 30,
            color: AppColors.whiteBackground,
          ),
          Icon(
            CupertinoIcons.device_desktop,
            size: 30,
            color: AppColors.whiteBackground,
          ),
          Icon(
            CupertinoIcons.clock,
            size: 30,
            color: AppColors.whiteBackground,
          ),
          Icon(
            CupertinoIcons.settings,
            size: 30,
            color: AppColors.whiteBackground,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}
