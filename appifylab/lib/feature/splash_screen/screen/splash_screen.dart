import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/const/app_colors.dart';
import '../../../core/const/image_path.dart';
import '../controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashScreenController controller = Get.put(SplashScreenController());
    var screenWidth = MediaQuery.of(context).size.width;
return Scaffold(
  body: Container(
    decoration: BoxDecoration(
      gradient: AppColors.gradientsColor[1],
    ),
    child: Center(
      child: Image.asset(
        ImagePath.logo,
        width: screenWidth * .5,
      ),
    ),
  ),
);
  }
}
