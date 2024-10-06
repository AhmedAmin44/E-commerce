import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';


class BottomBar extends StatelessWidget {
  const BottomBar(
      {super.key, required this.selectedIndex, required this.onItemTapped});
  final int selectedIndex;
  final void Function(int)? onItemTapped;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedIconTheme: const IconThemeData(
        color: AppColors.primaryColor,
        opacity: 1.0,
      ),
      unselectedIconTheme: const IconThemeData(
        color: AppColors.black,
        opacity: 0.8,
      ),
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: " "),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.notification_important_rounded,
            ),
            label: " "),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark,
            ),
            label: " "),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: " "),
      ],
    );
  }
}
