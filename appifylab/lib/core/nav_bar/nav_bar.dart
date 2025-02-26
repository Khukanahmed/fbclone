import 'package:appifylab/core/const/app_colors.dart';
import 'package:appifylab/feature/news_feed/view/news_feed_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBar extends StatelessWidget {
  final RxInt selectedIndex = 0.obs;

  final List<Widget> screens = [
    NewsFeedPage(),
    // LogoutScreen(),
  ];

  NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: screens[selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex.value,
          onTap: (index) => selectedIndex.value = index,
          selectedItemColor: AppColors.primaryColor, // Selected label color
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.groups_rounded, ),
              label: "Community",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Logout"),
          ],
        ),
      ),
    );
  }
}
