import 'package:appifylab/feature/auth/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:appifylab/core/const/app_colors.dart';
import 'package:appifylab/feature/news_feed/view/news_feed_screen.dart';

class NavBar extends StatelessWidget {
  final RxInt selectedIndex = 0.obs;

  final List<Widget> screens = [NewsFeedPage()];

  NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body:
            selectedIndex.value == 1
                ? Container()
                : screens[selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex.value,
          onTap: (index) {
            if (index == 1) {
              _showLogoutConfirmationDialog(context);
            } else {
              selectedIndex.value = index;
            }
          },
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.groups_rounded),
              label: "Community",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Logout"),
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Are you sure, you want to log out?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                SizedBox(height: 20),
                Divider(thickness: 1, color: Colors.grey.shade300),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          _logout(context);
                          Get.back();
                        },
                        child: Text(
                          "Yes",
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ),
                    ),
                    VerticalDivider(thickness: 1, color: Colors.grey.shade300),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "No",
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _logout(BuildContext context) async {
    Get.offAll(() => LoginScreen());
  }
}
